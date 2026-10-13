import { mkdir, readFile, writeFile } from "node:fs/promises";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { marked } from "marked";

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, "..");
const outDir = join(here, "canonico");

const pages = [
  {
    src: "Casos de Uso - Consulado da Mulher_v10.2.md",
    out: "casos-de-uso.html",
    title: "Casos de uso v10.2",
  },
  {
    src: "Tipos_de_Atividade.md",
    out: "tipos-de-atividade.html",
    title: "Tipos de atividade",
  },
  {
    src: "docs/jornadas/comunicacao.md",
    out: "comunicacao.html",
    title: "Comunicação",
  },
  {
    src: "docs/jornadas/README.md",
    out: "jornadas.html",
    title: "Jornadas",
  },
  {
    src: "docs/jornadas/online.md",
    out: "jornada-online.html",
    title: "Jornada online",
  },
  {
    src: "docs/jornadas/presencial-hibrido.md",
    out: "jornada-ph.html",
    title: "Jornada presencial / híbrido",
  },
  {
    src: "docs/jornadas/pos-liberacao.md",
    out: "pos-liberacao.html",
    title: "Pós-liberação",
  },
  {
    src: "simulador-comunicacao/README.md",
    out: "simulador.html",
    title: "Simulador de comunicação",
  },
];

const FILE_MAP = {
  "Casos de Uso - Consulado da Mulher_v10.2.md": "casos-de-uso.html",
  "Tipos_de_Atividade.md": "tipos-de-atividade.html",
  "comunicacao.md": "comunicacao.html",
  "online.md": "jornada-online.html",
  "presencial-hibrido.md": "jornada-ph.html",
  "pos-liberacao.md": "pos-liberacao.html",
};

function rewriteHref(href) {
  if (/^(https?:|mailto:|#)/i.test(href)) return href;
  const hashIndex = href.indexOf("#");
  const pathPart = hashIndex === -1 ? href : href.slice(0, hashIndex);
  const hash = hashIndex === -1 ? "" : href.slice(hashIndex);
  let decoded = pathPart;
  try {
    decoded = decodeURIComponent(pathPart);
  } catch {
    /* keep raw */
  }
  const normalized = decoded.replace(/\\/g, "/");
  const file = normalized.split("/").pop();
  if (normalized.includes("simulador-comunicacao/README.md")) {
    return "simulador.html" + hash;
  }
  if (
    normalized.includes("docs/jornadas/README.md") ||
    normalized === "README.md" ||
    normalized === "./README.md"
  ) {
    return "jornadas.html" + hash;
  }
  if (file && FILE_MAP[file]) return FILE_MAP[file] + hash;
  return href;
}

function rewriteLinks(markdown) {
  return markdown.replace(/\]\(([^)]+)\)/g, (_, href) => "](" + rewriteHref(href) + ")");
}

function decodeEntities(text) {
  return text
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'");
}

function mermaidBlocks(html) {
  return html.replace(
    /<pre><code class="language-mermaid">([\s\S]*?)<\/code><\/pre>/g,
    (_, code) =>
      '<div class="mermaid-wrap"><pre class="mermaid">' +
      decodeEntities(code) +
      "</pre></div>",
  );
}

function pageShell(title, body) {
  return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${title} — Consulado da Mulher</title>
  <link rel="stylesheet" href="../assets/css/site.css">
  <script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
  <script src="../assets/js/mermaid-init.js"></script>
</head>
<body>
  <button type="button" class="menu-toggle" aria-label="Abrir menu">Menu</button>
  <div class="layout">
    <aside class="sidebar"></aside>
    <main class="main">
      <p class="canon-source">Canônico v10.2 · gerado a partir do Markdown-fonte</p>
      <article class="prose">
${body}
      </article>
    </main>
  </div>
  <script src="../assets/js/nav.js"></script>
</body>
</html>
`;
}

await mkdir(outDir, { recursive: true });

for (const page of pages) {
  const raw = await readFile(join(root, page.src), "utf8");
  const html = mermaidBlocks(await marked.parse(rewriteLinks(raw)));
  await writeFile(join(outDir, page.out), pageShell(page.title, html), "utf8");
  console.log("wrote", page.out);
}
