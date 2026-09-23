export type CatalogItem = {
  elementName: string;
  body: string;
  status: string;
};

type RawTemplate = {
  elementName?: string;
  element_name?: string;
  data?: string;
  body?: string;
  status?: string;
  containerMeta?: string;
  template?: { data?: string; body?: string };
};

function extractBody(t: RawTemplate): string {
  const fromMeta = parseContainer(t.containerMeta);
  return (
    fromMeta ||
    t.data ||
    t.body ||
    t.template?.data ||
    t.template?.body ||
    ""
  ).trim();
}

function parseContainer(raw?: string): string {
  if (!raw) return "";
  try {
    const meta = JSON.parse(raw) as { data?: string; body?: string };
    return (meta.data || meta.body || "").trim();
  } catch {
    return "";
  }
}

function asList(json: unknown): RawTemplate[] {
  if (!json || typeof json !== "object") return [];
  const o = json as Record<string, unknown>;
  const candidates = [o.templates, o.data, o.templateList];
  for (const c of candidates) {
    if (Array.isArray(c)) return c as RawTemplate[];
  }
  if (Array.isArray(json)) return json as RawTemplate[];
  return [];
}

async function tryFetch(
  url: string,
  key: string,
): Promise<{ ok: boolean; status: number; json: unknown }> {
  const res = await fetch(url, {
    headers: { apikey: key },
    cache: "no-store",
  });
  let json: unknown = null;
  try {
    json = await res.json();
  } catch {
    json = null;
  }
  return { ok: res.ok, status: res.status, json };
}

export async function fetchGupshupTemplates(): Promise<{
  items: CatalogItem[];
  error?: string;
}> {
  const key = process.env.GUPSHUP_API_KEY;
  const appId = process.env.GUPSHUP_APP_ID;
  const appName = process.env.GUPSHUP_APP_NAME;
  if (!key) return { items: [], error: "GUPSHUP_API_KEY ausente" };

  const slugs = [appId, appName].filter(Boolean) as string[];
  const urls = slugs.flatMap((slug) => [
    `https://api.gupshup.io/wa/app/${encodeURIComponent(slug)}/template`,
    `https://partner.gupshup.io/partner/app/${encodeURIComponent(slug)}/templates`,
  ]);

  let lastStatus = 0;
  for (const url of urls) {
    const res = await tryFetch(url, key);
    lastStatus = res.status;
    if (!res.ok) continue;
    const items: CatalogItem[] = [];
    for (const t of asList(res.json)) {
      const elementName = t.elementName || t.element_name || "";
      const body = extractBody(t);
      if (!elementName || !body) continue;
      items.push({
        elementName,
        body,
        status: t.status || "desconhecido",
      });
    }
    if (items.length) return { items };
  }

  return {
    items: [],
    error: lastStatus
      ? `Gupshup respondeu ${lastStatus}`
      : "Nenhum template na resposta",
  };
}

export function asMap(items: CatalogItem[]): Record<string, string> {
  const map: Record<string, string> = {};
  for (const item of items) map[item.elementName] = item.body;
  return map;
}
