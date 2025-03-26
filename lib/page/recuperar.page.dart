import 'package:app_validacao/model/recuperar.model.dart';
import 'package:app_validacao/validation/validation.dart';
import 'package:flutter/material.dart';

class RecuperarPage extends StatefulWidget {
  
  final Recuperar recuperar;

  const RecuperarPage({super.key, required this.recuperar});


  @override
  State<RecuperarPage> createState() => _RecuperarPageState();

}

class _RecuperarPageState extends State<RecuperarPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  Widget _buildEmailField(){
    return TextFormField(
      controller: emailController,
      validator: Validation.validationEmail,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.alternate_email,
          color: Color.fromRGBO(180, 180, 180, 1),
        ),
        labelText: 'Digite seu Email',
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
          color: Color.fromRGBO(180, 180, 180, 1)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar conta'),
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
        padding:  EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Email
              _buildEmailField(),
              //
              SizedBox(height: 20,),
              // CPF
              _buildCPFField(),
              //
              SizedBox(height: 20,),
              // Botão Recuperar
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(147 , 197, 255, 1)),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(350, 58)),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.recuperar.email = emailController.text;
                    widget.recuperar.cpf = cpfController.text;
                    Navigator.pop(
                      context,
                    );
                  }
                },
                child: Text(
                  'Recuperar senha',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}