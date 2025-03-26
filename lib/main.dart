import 'package:app_validacao/model/recuperar.model.dart';
import 'package:app_validacao/model/registrar.model.dart';
import 'package:app_validacao/page/home.page.dart';
import 'package:app_validacao/page/recuperar.page.dart';
import 'package:app_validacao/page/registrar.page.dart';
import 'package:flutter/material.dart';
import 'package:app_validacao/validation/validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Validação',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 156, 230, 1)),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Entrar na sua conta'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool offPass = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  _showPassword() {
    setState(() {
      offPass = !offPass;
    });
  }



  Widget _buildAvatar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset(
        'assets/avatar.jpeg',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
      controller: emailController,
      validator: Validation.validationEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Digite seu email',
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Color.fromRGBO(180, 180, 180, 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )
        ),
      ),
    );
  }

  Widget _buildSenhaField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: TextFormField(
        controller: senhaController,
        validator: Validation.validationSenha,
        obscureText: offPass,
        decoration: InputDecoration(
          suffixIcon: IconButton( 
            icon: Icon(offPass ? Icons.visibility_off : Icons.visibility),
            onPressed:  _showPassword),
            labelText: 'Digite sua senha',
            hintText: 'Digite sua senha',
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: Color.fromRGBO(180, 180, 180, 1),
            ),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(255, 156, 230, 1),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // avatar
              _buildAvatar(),
              //
              SizedBox(height: 20,),
              // Email
              _buildEmailField(),
              //
              SizedBox(height: 20,),
              // Senha
              _buildSenhaField(),
              //
              SizedBox(height: 20,),
              // Botão de entrar
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(147, 197, 255, 1)),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(350, 58)) 
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Logando");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(), 
                      ),
                    );
                  } else {
                    print("Login Invalido");
                  }
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
              //
              SizedBox(height: 20,),
              // Ou
              Text(
                "Ou",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              //
              SizedBox(height: 20,),
              // Botão de registrar
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(255, 125, 125, 1)),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(350, 58))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrarPage(
                        registrar: Registrar(
                          email: "",
                          cpf: "",
                          telefone: "",
                          senha: "",
                          confirmaSenha: "",
                        )
                      )
                    ),
                  );
                  print("Criar uma nova conta");
                },
                child: Text(
                  'Criar uma nova conta',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              //
              SizedBox(height: 20,),
              // Botão de Recuperar
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(255, 192, 129, 1)),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(350, 58))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecuperarPage(
                        recuperar: Recuperar(
                          email: "",
                          cpf: "",
                        ),
                      ),
                    ),
                  );
                  print("Recuperar a conta");
                },
                child: Text(
                  "Recuperar a conta",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          )
        ) 
      ),
    );
  }
}
