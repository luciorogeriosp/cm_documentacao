import { clockFor, isOutgoing } from "@/lib/engine";
import { emailFromName } from "@/lib/placeholders";
import type { ChannelView, Journey, ThreadItem } from "@/lib/types";
import { useEffect, useRef, type ReactNode } from "react";

export function MessageBody({ text }: { text: string }) {
  const nodes: ReactNode[] = [];
  const pattern = /(\{\{\d+\}\})/g;
  let last = 0;
  let match: RegExpExecArray | null;
  let key = 0;
  while ((match = pattern.exec(text))) {
    if (match.index > last) {
      nodes.push(text.slice(last, match.index));
    }
    nodes.push(
      <span key={`ph-${key++}`} className="ph">
        {match[1]}
      </span>,
    );
    last = match.index + match[1].length;
  }
  if (last < text.length) nodes.push(text.slice(last));
  return <p>{nodes.length ? nodes : text}</p>;
}


export function ViewSwitch({
  view,
  onChange,
}: {
  view: ChannelView;
  onChange: (view: ChannelView) => void;
}) {
  return (
    <div className="view-switch" role="tablist" aria-label="Como ela vê">
      <button
        type="button"
        role="tab"
        aria-selected={view === "whatsapp"}
        className={view === "whatsapp" ? "on" : ""}
        onClick={() => onChange("whatsapp")}
      >
        WhatsApp
      </button>
      <button
        type="button"
        role="tab"
        aria-selected={view === "email"}
        className={view === "email" ? "on" : ""}
        onClick={() => onChange("email")}
      >
        E-mail
      </button>
    </div>
  );
}

export function WhatsAppFrame({
  journey,
  programa,
  items,
  emptyHint,
  composer,
}: {
  journey: Journey;
  programa: string;
  items: ThreadItem[];
  emptyHint?: string;
  composer?: { hint: string; onSend: () => void };
}) {
  const name = programa;
  const paper = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = paper.current;
    if (!el) return;
    el.scrollTop = el.scrollHeight;
  }, [items]);

  return (
    <div className="wa-phone">
      <header className="wa-bar">
        <span className="wa-back" aria-hidden>
          ‹
        </span>
        <span className="wa-avatar" aria-hidden>
          C
        </span>
        <div className="wa-who">
          <strong>{name}</strong>
          <small>
            número do programa · {journey === "ph" ? "presencial / híbrido" : "online"}
          </small>
        </div>
      </header>
      <div className="wa-paper" ref={paper}>
        {items.length === 0 ? (
          emptyHint ? <p className="wa-empty">{emptyHint}</p> : null
        ) : (
          items.map((item, i) => {
            if (item.silent || item.channels.includes("nenhum") || item.channels.includes("nota")) {
              return null;
            }
            if (item.channels.length && !item.channels.includes("whatsapp") && !item.channels.includes("grupo")) {
              return null;
            }
            const mine = isOutgoing(item);
            const group = item.channels.includes("grupo");
            return (
              <div
                key={`${item.stepId}-${i}`}
                className={`wa-row ${mine ? "mine" : "theirs"}`}
              >
                <div className={`wa-bubble ${mine ? "out" : "in"} ${group ? "group" : ""}`}>
                  {!mine ? (
                    <div className="wa-name">{group ? "Turma" : name}</div>
                  ) : (
                    <div className="wa-name">Você</div>
                  )}
                  {mine && item.trigger === "ok" ? (
                    <p>OK</p>
                  ) : item.kind === "video" || item.kind === "pdf" ? (
                    <div className="wa-media">
                      <span className="wa-media-icon" aria-hidden>
                        {item.kind === "video" ? "▶" : "📄"}
                      </span>
                      <div>
                        <strong>{item.title}</strong>
                        <small>{item.body}</small>
                      </div>
                    </div>
                  ) : (
                    <MessageBody text={item.body} />
                  )}
                  <time>
                    {clockFor(i)}
                    {mine ? <span className="wa-ticks">✓✓</span> : null}
                  </time>
                </div>
              </div>
            );
          })
        )}
      </div>
      <footer className="wa-composer">
        {composer ? (
          <button type="button" className="wa-send" onClick={composer.onSend}>
            {composer.hint}
            <i aria-hidden>➤</i>
          </button>
        ) : (
          <>
            <span>Mensagem</span>
            <i aria-hidden>➤</i>
          </>
        )}
      </footer>
    </div>
  );
}

export function EmailFrame({
  programa,
  nome,
  items,
  emptyHint,
}: {
  journey: Journey;
  programa: string;
  nome: string;
  items: ThreadItem[];
  emptyHint?: string;
}) {
  const from = `${programa} <nao-responda@consulado.org.br>`;
  const to = `${nome} <${emailFromName(nome)}>`;
  const inbox = [...items].reverse();
  const list = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const el = list.current;
    if (!el) return;
    el.scrollTop = 0;
  }, [items]);

  return (
    <div className="mail-app">
      <header className="mail-bar">
        <strong>Caixa de entrada</strong>
        <small>{to}</small>
      </header>
      <div className="mail-list" ref={list}>
        {inbox.length === 0 ? (
          emptyHint ? <p className="mail-empty">{emptyHint}</p> : null
        ) : (
          inbox.map((item, i) => {
            if (
              item.silent ||
              item.channels.includes("nenhum") ||
              item.channels.includes("nota") ||
              !item.channels.includes("email")
            ) {
              return null;
            }
            return (
              <article className="mail-msg" key={`${item.stepId}-${i}`}>
                <div className="mail-avatar" aria-hidden>
                  C
                </div>
                <div className="mail-body">
                  <div className="mail-top">
                    <strong>{programa}</strong>
                    <time>{clockFor(inbox.length - 1 - i)}</time>
                  </div>
                  <div className="mail-subject">{item.title}</div>
                  <div className="mail-headers">
                    De: {from}
                    <br />
                    Para: {to}
                  </div>
                  <MessageBody text={item.body} />
                </div>
              </article>
            );
          })
        )}
      </div>
    </div>
  );
}
