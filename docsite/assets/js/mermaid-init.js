(function () {
  if (typeof mermaid === "undefined") return;

  mermaid.initialize({
    startOnLoad: false,
    theme: "neutral",
    securityLevel: "loose",
  });

  function decode(text) {
    return text
      .replace(/&amp;/g, "&")
      .replace(/&lt;/g, "<")
      .replace(/&gt;/g, ">")
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, "'");
  }

  function sanitize(def) {
    return def
      .split("\n")
      .map(function (line) {
        if (/->>|-->>|Note over/.test(line) && line.indexOf(";") !== -1) {
          return line.replace(/;/g, ",");
        }
        return line;
      })
      .join("\n");
  }

  async function renderAll() {
    const nodes = document.querySelectorAll("pre.mermaid, .mermaid");
    let n = 0;
    for (const node of nodes) {
      if (node.querySelector("svg")) continue;
      const def = sanitize(decode(node.textContent || "")).trim();
      if (!def) continue;
      try {
        const { svg } = await mermaid.render("docsite-mmd-" + n++, def);
        node.innerHTML = svg;
      } catch (err) {
        node.setAttribute("data-mermaid-error", String((err && err.message) || err));
      }
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", renderAll);
  } else {
    renderAll();
  }
})();
