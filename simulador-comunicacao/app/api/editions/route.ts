import { EDITIONS } from "@/lib/cms/edition";
import {
  fetchStrapiEdicoesList,
  mapStrapiEditionSummary,
  pickDefault,
} from "@/lib/cms/strapi";
import { defaultYear, yearsOf } from "@/lib/cms/years";
import { NextResponse } from "next/server";

export async function GET() {
  try {
    const raw = await fetchStrapiEdicoesList();
    const editions = raw.map(mapStrapiEditionSummary);
    const chosen = pickDefault(editions);
    return NextResponse.json({
      source: "cms",
      years: yearsOf(editions),
      editions,
      defaultId: chosen?.id ?? null,
      defaultYear: defaultYear(editions, chosen?.id),
    });
  } catch (error) {
    const editions = EDITIONS.map((item) => ({
      id: item.id,
      name: item.name,
      slug: item.slug,
      anoReferencia: item.anoReferencia,
      journey: item.journey,
      tipo: item.tipo,
      ativo: item.ativo,
      programaNome: item.programaNome,
      datas: item.datas,
    }));
    return NextResponse.json({
      source: "mock",
      years: yearsOf(editions),
      editions,
      defaultId: editions[0]?.id ?? null,
      defaultYear: defaultYear(editions),
      error: error instanceof Error ? error.message : "Falha no CMS",
    });
  }
}
