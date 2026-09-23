"use client";

import type { CatalogItem } from "@/lib/gupshup";
import { useMemo, useState } from "react";

type StatusFilter = "aprovadas" | "reprovadas";

function matchesStatus(item: CatalogItem, filter: StatusFilter): boolean {
  const status = item.status.toLowerCase();
  if (filter === "aprovadas") {
    return status.includes("approv") || status.includes("aprovad");
  }
  return (
    status.includes("reject") ||
    status.includes("reprov") ||
    status.includes("fail") ||
    status.includes("denied")
  );
}

function matchesQuery(item: CatalogItem, query: string): boolean {
  const needle = query.trim().toLowerCase();
  if (needle.length < 3) return false;
  return (
    item.elementName.toLowerCase().includes(needle) ||
    item.body.toLowerCase().includes(needle)
  );
}

export function CatalogViewer({
  items,
  source,
  error,
  selected,
  onSelect,
}: {
  items: CatalogItem[];
  source: "gupshup" | "mock";
  error: string | null;
  selected: string;
  onSelect: (name: string) => void;
}) {
  const [statusFilter, setStatusFilter] = useState<StatusFilter>("aprovadas");
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const [highlight, setHighlight] = useState(0);

  const byStatus = useMemo(
    () => items.filter((item) => matchesStatus(item, statusFilter)),
    [items, statusFilter],
  );

  const matches = useMemo(() => {
    if (query.trim().length < 3) return [];
    return byStatus.filter((item) => matchesQuery(item, query));
  }, [byStatus, query]);

  const current = items.find((item) => item.elementName === selected);
  const ready = query.trim().length >= 3;

  function pick(item: CatalogItem) {
    onSelect(item.elementName);
    setQuery(item.elementName);
    setOpen(false);
  }

  function changeStatus(next: StatusFilter) {
    setStatusFilter(next);
    setQuery("");
    setOpen(false);
    setHighlight(0);
    onSelect("");
  }

  return (
    <section className="catalog">
      {source !== "gupshup" && error ? <p className="hint">{error}</p> : null}
      <fieldset className="radios">
        <label>
          <input
            type="radio"
            name="catalog-status"
            checked={statusFilter === "aprovadas"}
            onChange={() => changeStatus("aprovadas")}
          />
          Aprovadas
        </label>
        <label>
          <input
            type="radio"
            name="catalog-status"
            checked={statusFilter === "reprovadas"}
            onChange={() => changeStatus("reprovadas")}
          />
          Reprovadas
        </label>
      </fieldset>
      <label className="field typeahead">
        Template
        <input
          value={query}
          onChange={(e) => {
            setQuery(e.target.value);
            setOpen(true);
            setHighlight(0);
          }}
          onFocus={() => setOpen(query.trim().length >= 3)}
          onBlur={() => window.setTimeout(() => setOpen(false), 120)}
          onKeyDown={(e) => {
            if (!open || !matches.length) return;
            if (e.key === "ArrowDown") {
              e.preventDefault();
              setHighlight((i) => (i + 1) % matches.length);
            } else if (e.key === "ArrowUp") {
              e.preventDefault();
              setHighlight((i) => (i - 1 + matches.length) % matches.length);
            } else if (e.key === "Enter") {
              e.preventDefault();
              pick(matches[highlight]);
            } else if (e.key === "Escape") {
              setOpen(false);
            }
          }}
          placeholder="Digite 3 letras…"
          disabled={!byStatus.length}
          autoComplete="off"
        />
        {open && ready ? (
          <ul className="typeahead-list">
            {matches.length ? (
              matches.map((item, i) => (
                <li key={item.elementName}>
                  <button
                    type="button"
                    className={i === highlight ? "on" : ""}
                    onMouseDown={(e) => e.preventDefault()}
                    onClick={() => pick(item)}
                  >
                    <strong>{item.elementName}</strong>
                    <span>{item.body}</span>
                  </button>
                </li>
              ))
            ) : (
              <li className="typeahead-empty">
                Nenhum template com essas letras
              </li>
            )}
          </ul>
        ) : null}
      </label>
      {current ? (
        <article className="catalog-preview">
          <p>{current.body}</p>
        </article>
      ) : null}
    </section>
  );
}
