import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/custom_dialog.dart';
import 'package:flutter_template/presentation/components/custom_snackbar.dart';
import 'package:flutter_template/presentation/components/index.dart';
import 'package:flutter_template/presentation/providers/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  String? selectedBrandId;

  @override
  Widget build(BuildContext context) {
    final brandProvider = context.watch<BrandProvider>();

    final List<Brand> brands = brandProvider.brandList;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Calcular'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: _image == null
                    ? const Center(child: Text('No hay imagen seleccionada'))
                    : Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: const Text('Seleccionar opción'),
                value: selectedBrandId,
                onChanged: (value) {
                  setState(() {
                    selectedBrandId = value;
                  });
                },
                items: brands.map((brand) {
                  return DropdownMenuItem<String>(
                    value: brand.id.toString(),
                    child: Text(brand.nombre),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFFF1000),
                    Color(0xFF2508FF),
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                ),
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () async {
                    // Seleccionar una imagen
                    final result = await FilePicker.platform
                        .pickFiles(type: FileType.image);
                    if (result != null) {
                      final pickedFile = result.files.single;
                      final String filePath = pickedFile.path!;
                      setState(() {
                        _image = File(filePath);
                      });
                      final checkProvider = context.read<CheckProvider>();
                      await checkProvider.checkImage(
                          int.parse(selectedBrandId!), filePath);
                      CustomDialog.showSuccessDialog(
                          context,
                          'Analisis realizado',
                          'Servicio: ${checkProvider.check.nombreServicio} \n Descripcion: ${checkProvider.check.descripcionServicio} \n Precio: ${checkProvider.check.precioEstimado} Bs');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        CustomSnackBar(
                          message: 'No se seleccionó ninguna imagen',
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                  color: Colors.transparent,
                  child: const Text(
                    "Seleccione una imagen para el análisis",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
