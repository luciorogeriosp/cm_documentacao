import { fetchGupshupTemplates } from "@/lib/gupshup";
import { NextResponse } from "next/server";

export async function GET() {
  try {
    const { items, error } = await fetchGupshupTemplates();
    return NextResponse.json({
      source: items.length ? "gupshup" : "mock",
      templates: items,
      error: error ?? null,
    });
  } catch {
    return NextResponse.json({
      source: "mock",
      templates: [],
      error: "Falha ao consultar o Gupshup",
    });
  }
}
