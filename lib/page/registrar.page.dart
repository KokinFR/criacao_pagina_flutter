import 'package:app_validacao/model/registrar.model.dart';
import 'package:app_validacao/validation/validation.dart';
import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  final Registrar registrar;
  const RegistrarPage({super.key, required this.registrar});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  
  bool offPass = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  _showPassword (){
    setState(() {
      offPass = !offPass;
    });
  }

  _showConfirmPassword () {
    setState(() {
      offPass = !offPass;
    });
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      validator: Validation.validationEmail,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.alternate_email,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Digite seu email',
        hintText: 'Digite seu email',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
  Widget _buildCPFField() {
    return TextFormField(
      controller: cpfController,
      validator: Validation.validationCPF,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.credit_card,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Digite seu CPF',
        hintText: 'Digite seu CPF',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
    );
  }
 
  Widget _buildTelefoneField() {
    return TextFormField(
      controller: telefoneController,
      validator: Validation.validationTelefone,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Digite seu telefone',
        hintText: 'Digite seu telefone',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
          fontWeight: FontWeight.w900
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        )
      )
    );
  }

  Widget _buildSenhaField() {
    return TextFormField(  
      controller: senhaController,
      validator: Validation.validationSenha,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: _showPassword, 
          icon: Icon(offPass ? Icons.visibility : Icons.visibility_off),
        ),
        prefixIcon: Icon(
          Icons.password,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Digite sua senha',
        hintText: 'Digite sua senha',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
          fontWeight: FontWeight.w900,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
    );
  }

  Widget _buildConfirmaSenhaField() {
    return TextFormField(
      controller: confirmarSenhaController,
      validator: (value) => Validation.validationConfirmaSenha(value, senhaController.text),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: _showConfirmPassword, 
          icon: Icon(offPass ? Icons.visibility : Icons.visibility_off),
        ),
        prefixIcon: Icon(
          Icons.password,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Confirme a senha',
        hintText: 'Confirme a senha',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
          fontWeight: FontWeight.w900
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar uma nova conta',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color.fromRGBO(45, 45, 45, 1)
          ),
        ),
        
        backgroundColor: Color.fromRGBO(255, 156, 230, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Email
              _buildEmailField(),
              //
              SizedBox(height: 20,),
              //CPF
              _buildCPFField(),
              //
              SizedBox(height: 20,),
              //Telefone
              _buildTelefoneField(),
              //
              SizedBox(height: 20,),
              //Senha
              _buildSenhaField(),
              //
              SizedBox(height: 20,),
              //ConfirmaSenha
              _buildConfirmaSenhaField(),
              //
              SizedBox(height: 20,),
              //Botão
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(92, 255, 166, 1)),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(350, 58)),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.registrar.email = emailController.text;
                    widget.registrar.cpf = cpfController.text;
                    widget.registrar.telefone = telefoneController.text;
                    widget.registrar.senha = senhaController.text;
                    widget.registrar.confirmaSenha = confirmarSenhaController.text;
                    Navigator.pop(
                      context,
                    );
                  }
                }, 
                child:  Text(
                  'Criar Conta e Entrar',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}