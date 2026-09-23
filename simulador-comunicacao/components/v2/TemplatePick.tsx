"use client";

import type { CatalogItem } from "@/lib/gupshup";

function approved(items: CatalogItem[]) {
  const hits = items.filter((item) =>
    /approv|aprovad/i.test(item.status),
  );
  return hits.length ? hits : items;
}

export function TemplatePick({
  value,
  items,
  onChange,
}: {
  value: string;
  items: CatalogItem[];
  onChange: (name: string) => void;
}) {
  const options = approved(items);
  const known = options.some((item) => item.elementName === value);
  return (
    <select
      className="tl-tpl"
      value={value}
      title={value || "sem template"}
      onClick={(e) => e.stopPropagation()}
      onChange={(e) => onChange(e.target.value)}
    >
      <option value="">sem template</option>
      {!known && value ? <option value={value}>{value}</option> : null}
      {options.map((item) => (
        <option key={item.elementName} value={item.elementName}>
          {item.elementName}
        </option>
      ))}
    </select>
  );
}

export function templateOf(
  messages: { templateKey: string; outgoing?: boolean; kind?: string }[],
): string {
  return (
    messages.find(
      (message) => message.templateKey && !message.outgoing && message.kind !== "pdf",
    )?.templateKey || ""
  );
}
