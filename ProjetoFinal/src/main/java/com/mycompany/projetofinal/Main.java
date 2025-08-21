package com.mycompany.projetofinal;

import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws Exception {
        // Lê o arquivo Java como entrada do analisador
      FileReader reader = new FileReader("src/main/java/com/mycompany/projetofinal/ProjetoFinal.java");
      Lexer lexer = new Lexer(reader);



        System.out.println("🔎 Iniciando análise léxica de ProjetoFinal.java...");

        Object token;
        while ((token = lexer.yylex()) != null) {
            System.out.println("Token reconhecido: " + token);
        }

        System.out.println("✅ Análise léxica concluída.");
    }
}
