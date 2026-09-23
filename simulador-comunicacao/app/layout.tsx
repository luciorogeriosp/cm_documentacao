import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Simulador da jornada de comunicação",
  description:
    "Ferramenta à parte para percorrer as mensagens das jornadas online e P/H.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
