package com.mycompany.projetofinal;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidadorRGCPF {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {

        System.out.print("Insira um RG ou CPF (com pontuação e traço): ");
        String input = scanner.nextLine();

        if (isCPF(input)) {
            if (validarCPF(input)) {
                System.out.println("O CPF é válido.");
            } else {
                System.out.println("O CPF é inválido.");
            }
        } else if (isRG(input)) {
            if (validarRG(input)) {
                System.out.println("O RG é válido.");
            } else {
                System.out.println("O RG é inválido.");
            }
        } else {
            System.out.println("Formato inválido. Insira um RG ou CPF válido.");
        }

        scanner.close();
        }

    }

    private static boolean isCPF(String input) {
        String regex = "^(\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2})$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    private static boolean isRG(String input) {
        String regex = "^(\\d{1,2}\\.\\d{3}\\.\\d{3}-[0-9X])$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    private static boolean validarCPF(String cpf) {
        cpf = cpf.replaceAll("[^0-9]", ""); // Remove pontuação
        if (cpf.length() != 11)
            return false;

        int soma = 0;
        int peso = 10;
        for (int i = 0; i < 9; i++) {
            soma += Character.getNumericValue(cpf.charAt(i)) * peso--;
        }
        int digito1 = 11 - (soma % 11);
        digito1 = (digito1 >= 10) ? 0 : digito1;

        soma = 0;
        peso = 11;
        for (int i = 0; i < 10; i++) {
            soma += Character.getNumericValue(cpf.charAt(i)) * peso--;
        }
        int digito2 = 11 - (soma % 11);
        digito2 = (digito2 >= 10) ? 0 : digito2;

        return (digito1 == Character.getNumericValue(cpf.charAt(9)) &&
                digito2 == Character.getNumericValue(cpf.charAt(10)));
    }

    private static boolean validarRG(String rg) {
        rg = rg.replaceAll("[^0-9X]", ""); // Remove pontuação
        if (rg.length() != 9)
            return false; // Deve ter 8 dígitos + 1 dígito verificador

        int soma = 0;
        int peso = 2; // Começa com peso 2 para o primeiro dígito

        // Calcula a soma dos produtos dos dígitos pelos seus pesos
        for (int i = 0; i < 8; i++) {
            soma += Character.getNumericValue(rg.charAt(i)) * peso;
            peso++;
            if (peso > 9)
                peso = 2; // Reinicia o peso após 9
        }

        // Calcula o dígito verificador
        int digitoVerificador = soma % 11;
        if (digitoVerificador == 10) {
            digitoVerificador = 'X'; // Se o resultado for 10, o dígito verificador é 'X'
        }

        // Compara o dígito verificador calculado com o dígito informado
        return (digitoVerificador == Character.getNumericValue(rg.charAt(8)) ||
                (digitoVerificador == 10 && rg.charAt(8) == 'X'));
    }

}
