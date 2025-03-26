import 'package:flutter/material.dart';

class Validation {
  
  TextEditingController confirmarSenhaController = TextEditingController();

  static String? validationEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um email';
    }
    if (!value.contains('@') || !value.contains('.com')) {
      return 'O email está inválido';
    }
    if (value.length < 5) {
      return 'O email está curto';
    }
    return null;
  }

  static String? validationSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um senha';
    }
    if (value.length < 8) {
      return 'A senha está curta ';
    } else if (value.length > 16) {
      return 'Senha está grande';
    }
    return null;
  }

  static String? validationCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um CPF';
    }
    if (value.length != 11 ) {
      return 'CPF deve contém 11 digitos';
    }
    if (double.tryParse(value) == null) {
      return 'Digite apenas números';
    }
    return null;
  }

  static String? validationTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um número';
    }
    if (value.length != 11) {
      return 'Numero de telefone invalido';
    }
    return null;
  }
  static String? validationConfirmaSenha(String? value, String senha) {
    if (value == null || value.isEmpty) {
      return 'Confirmação da senha obrigatória';
    }
    if (value != senha) {
      return 'As senhas não coincidem';
    }
    return null;
  }
}