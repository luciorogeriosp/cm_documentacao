import { EDITION_EMPREENDE_ZAP, EDITIONS } from "@/lib/cms/edition";
import { fetchStrapiEdicao, mapStrapiEdition } from "@/lib/cms/strapi";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
  const id = new URL(request.url).searchParams.get("id");
  if (!id) {
    return NextResponse.json({ source: "cms", edition: null }, { status: 400 });
  }
  try {
    const raw = await fetchStrapiEdicao(id);
    if (!raw) {
      return NextResponse.json({ source: "cms", edition: null }, { status: 404 });
    }
    return NextResponse.json({ source: "cms", edition: mapStrapiEdition(raw) });
  } catch (error) {
    const fallback =
      EDITIONS.find((item) => item.id === id || item.slug === id) ||
      EDITION_EMPREENDE_ZAP;
    return NextResponse.json({
      source: "mock",
      edition: fallback,
      error: error instanceof Error ? error.message : "Falha no CMS",
    });
  }
}
