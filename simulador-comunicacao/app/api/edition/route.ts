import { mapStrapiEdition, fetchStrapiEdicoes, pickDefault } from "@/lib/cms/strapi";
import { NextResponse } from "next/server";

export async function GET(request: Request) {
  try {
    const id = new URL(request.url).searchParams.get("id");
    const raw = await fetchStrapiEdicoes();
    const editions = raw.map(mapStrapiEdition);
    const edition =
      editions.find((item) => item.id === id || item.slug === id) ||
      pickDefault(editions);
    if (!edition) {
      return NextResponse.json({ source: "cms", edition: null }, { status: 404 });
    }
    return NextResponse.json({ source: "cms", edition, editions });
  } catch (error) {
    return NextResponse.json(
      {
        source: "mock",
        edition: null,
        editions: [],
        error: error instanceof Error ? error.message : "Falha no CMS",
      },
      { status: 502 },
    );
  }
}
