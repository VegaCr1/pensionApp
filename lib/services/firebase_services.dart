import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore baseDeDatos = FirebaseFirestore.instance;

//obtener lista
Future<List> getEstudiante() async {
  List estudiante = [];

  CollectionReference collectionReferenceEstudiante =
      baseDeDatos.collection('estudiante');

  QuerySnapshot queryEstudiante = await collectionReferenceEstudiante.get();
  queryEstudiante.docs.forEach((element) {
    estudiante.add(element.data());
  });

  return estudiante;
}

//LISTA PENSIONES
Future<List> getPension() async {
  List pension = [];

  CollectionReference collectionReferenceEstudiante =
      baseDeDatos.collection('pension');

  QuerySnapshot queryEstudiante = await collectionReferenceEstudiante.get();
  queryEstudiante.docs.forEach((element) {
    pension.add(element.data());
  });

  return pension;
}

//agregar estudiante a a lista en firebase
Future<void> agregarEstudiante(
  String nombre,
  String correo,
  String contrasena,
  String telefono,
) async {
  // Crea una referencia al documento con el ID personalizado
  CollectionReference estudiantesRef = baseDeDatos.collection("estudiante");
  DocumentReference docRef = estudiantesRef.doc(correo);

  // Agrega los datos del estudiante al documento
  await docRef.set({
    "nombre": nombre,
    "correo": correo,
    "contraseña": contrasena,
    "telefono": telefono,
    "tipocuenta": "Estudiante",
  });
}

//agregar Pension a la base de datos firebase
Future<void> agregarPension(
    //Dato de cuenta
    String nombre,
    String correo,
    String contrasena,
    String telefono,
    String tipocuenta,

    //Datos de cuenta Pension
    String direccion,
    String barrio,
    String propietario,
    String ciudad,
    String sede) async {
  CollectionReference estudiantesRef = baseDeDatos.collection("pension");
  DocumentReference docRef = estudiantesRef.doc(correo);
  await docRef.set({
    "nombre": nombre,
    "correo": correo,
    "contraseña": contrasena,
    "telefono": telefono,
    "tipocuenta": tipocuenta,
    "direccion": direccion,
    "barrio": barrio,
    "propietario": propietario,
    "ciudad": ciudad,
    "sede": sede
  });
}

//AGREGAR CUENTAS DE TODO TIPO
Future<void> agregarCuenta(
    String correo, String password, String tipocuenta) async {
  CollectionReference estudiantesRef = baseDeDatos.collection("cuentas");
  DocumentReference docRef = estudiantesRef.doc(correo);
  await docRef.set({
    "correo": correo,
    "contraseña": password,
    "tipocuenta": tipocuenta,
  });
}
