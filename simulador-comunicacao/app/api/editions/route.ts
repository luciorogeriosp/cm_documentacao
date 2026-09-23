import { mapStrapiEdition, fetchStrapiEdicoes, pickDefault } from "@/lib/cms/strapi";
import { NextResponse } from "next/server";

export async function GET() {
  try {
    const raw = await fetchStrapiEdicoes();
    const editions = raw.map(mapStrapiEdition);
    return NextResponse.json({
      source: "cms",
      editions,
      defaultId: pickDefault(editions)?.id ?? null,
    });
  } catch (error) {
    return NextResponse.json(
      {
        source: "mock",
        editions: [],
        defaultId: null,
        error: error instanceof Error ? error.message : "Falha no CMS",
      },
      { status: 502 },
    );
  }
}
