import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


_launchURL(String uri) async {
  final url = uri;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir $url';
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Información y Contacto', style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),),
            backgroundColor: Color.fromRGBO(52, 54, 101, 1.0),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.6),
                end: FractionalOffset(0.0, 1.0),
                colors: [
                  Color.fromRGBO(52, 54, 101, 1.0),
                  Color.fromRGBO(35, 37, 57, 1.0)
                ]
              )
            ),
            child: SingleChildScrollView(
              child: FadeInLeft(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      color: Colors.white10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              
                              //Center(child: _infoAvatar()),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Text('    Hola queridos usuarios 👋🏼 soy Freddy, más conocido en internet como "Yiyeh", soy un Programador independiente 🤓 que inició con esta aplicación con el propósito de practicar programación, comencé con lo de sismología y bueno la cosa fue creciendo... Espero poder ayudarlos con la información recopilada de APIs publicas para el uso de cualquiera.', textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 15),),
                          SizedBox(height: 15,),
                          Text('¿Quieres notificar algún error o tienes alguna sugerencia?, puedes contactarme con el siguiente correo.', textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(height: 15,),
                          Center(child: Text('YiyehDev@gmail.com',  style: TextStyle(color: Colors.white, fontSize: 15),)),
                          SizedBox(height: 15,),
                          Text('La App se continuará actualizando con el tiempo para añadir más contenido y funcionalidades.', textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(height: 10,),
                          Text('¿Quieres Ayudarme? Bueno... todo programador necesita Café para seguir programando ☕️, invitame uno.', textAlign: TextAlign.justify, style: TextStyle(color: Colors.white, fontSize: 15)),
                          SizedBox(height: 15,),
                          GestureDetector(
                            onTap: (){
                              _launchURL('https://www.buymeacoffee.com/Yiyeh');
                            },
                            child: Center(child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white10
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.coffee, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text('Invitame un Café', style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.left,)
                                ],
                              ),
                            )),
                          ),
                          SizedBox(height: 15,),
                          Text('Fuentes: Minsal, Wikipedia, Gael, Sismologia.cl, Mindicator, Banco central de Chile', style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.left,),
                          SizedBox(height: 5)
                                          
                        ],          
                      ),               
                    ),
                  SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

  // Widget _infoAvatar(){
  //   return Container(
  //     child: CircleAvatar(
  //       radius: 35,
  //       child: Text('Y', style: TextStyle(fontSize: 35),),
  //     ),
  //   );
  // }
}