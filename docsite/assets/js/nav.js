(function () {
  const script = document.querySelector('script[src*="nav.js"]');
  const src = (script && script.getAttribute("src")) || "assets/js/nav.js";
  const prefix = src.startsWith("../") ? "../" : "";

  function group(title, links) {
    return (
      '<div class="nav-group"><div class="nav-group-title">' +
      title +
      "</div>" +
      links
        .map(function (item) {
          return (
            '<a href="' +
            prefix +
            item.href +
            '" data-page="' +
            item.page +
            '">' +
            item.label +
            "</a>"
          );
        })
        .join("") +
      "</div>"
    );
  }

  const html =
    '<div class="sidebar-header"><h1>Consulado da Mulher</h1><p>Especificação — canônico v10.2</p></div><nav>' +
    group("Canônico (v10.2)", [
      { href: "canonico/casos-de-uso.html", page: "casos-de-uso.html", label: "Casos de uso" },
      { href: "canonico/tipos-de-atividade.html", page: "tipos-de-atividade.html", label: "Tipos de atividade" },
      { href: "canonico/comunicacao.html", page: "comunicacao.html", label: "Comunicação" },
      { href: "canonico/jornadas.html", page: "jornadas.html", label: "Jornadas" },
      { href: "canonico/jornada-online.html", page: "jornada-online.html", label: "Online" },
      { href: "canonico/jornada-ph.html", page: "jornada-ph.html", label: "P/H" },
      { href: "canonico/pos-liberacao.html", page: "pos-liberacao.html", label: "Pós-liberação" },
      { href: "canonico/simulador.html", page: "simulador.html", label: "Simulador" },
    ]) +
    group("Início", [
      { href: "index.html", page: "index.html", label: "Hub" },
      { href: "visao-geral.html", page: "visao-geral.html", label: "Visão geral" },
      { href: "personas.html", page: "personas.html", label: "Personas" },
      { href: "mapa-jornadas.html", page: "mapa-jornadas.html", label: "Mapa de jornadas" },
    ]) +
    group("Rascunho de prototipação", [
      { href: "requisitos-funcionais.html", page: "requisitos-funcionais.html", label: "Funcionais" },
      { href: "requisitos-nao-funcionais.html", page: "requisitos-nao-funcionais.html", label: "Não funcionais" },
      { href: "modulos/portal-empreendedora.html", page: "portal-empreendedora.html", label: "Portal empreendedora" },
      { href: "modulos/portal-gestao.html", page: "portal-gestao.html", label: "Portal gestão" },
      { href: "modulos/dashboard-bi.html", page: "dashboard-bi.html", label: "Dashboard BI" },
      { href: "modulos/app-equipe.html", page: "app-equipe.html", label: "App equipe" },
      { href: "modulos/chat-ia.html", page: "chat-ia.html", label: "Chat IA" },
      { href: "programas/catalogo.html", page: "catalogo.html", label: "Catálogo de programas" },
      { href: "dados/cadastro-e-lgpd.html", page: "cadastro-e-lgpd.html", label: "Cadastro e LGPD" },
      { href: "dados/migracao-historico.html", page: "migracao-historico.html", label: "Migração histórico" },
      { href: "dados/selecao-editais.html", page: "selecao-editais.html", label: "Seleção e editais" },
      { href: "jornadas/empreendedora-inscricao.html", page: "empreendedora-inscricao.html", label: "Inscrição e onboarding" },
      { href: "jornadas/empreendedora-empreende-mulher.html", page: "empreendedora-empreende-mulher.html", label: "Empreende Mulher" },
      { href: "jornadas/empreendedora-empreende-zap.html", page: "empreendedora-empreende-zap.html", label: "Empreende no Zap" },
      { href: "jornadas/gestor-operacao.html", page: "gestor-operacao.html", label: "Gestor — operação" },
      { href: "jornadas/gestor-presenca-eventos.html", page: "gestor-presenca-eventos.html", label: "Gestor — presença" },
      { href: "jornadas/admin-configuracao.html", page: "admin-configuracao.html", label: "Admin — configuração" },
      { href: "jornadas/admin-bi-impacto.html", page: "admin-bi-impacto.html", label: "Admin — BI e impacto" },
    ]) +
    "</nav>";

  const sidebar = document.querySelector(".sidebar");
  if (sidebar) sidebar.innerHTML = html;

  const toggle = document.querySelector(".menu-toggle");
  if (toggle && sidebar) {
    toggle.addEventListener("click", function () {
      sidebar.classList.toggle("open");
    });
  }

  const path = window.location.pathname.replace(/\\/g, "/");
  const file = path.split("/").pop() || "index.html";
  document.querySelectorAll(".sidebar nav a[data-page]").forEach(function (link) {
    const page = link.getAttribute("data-page");
    if (page === file || (file === "" && page === "index.html")) {
      link.classList.add("active");
    }
  });
})();
