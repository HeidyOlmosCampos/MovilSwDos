import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/presentation/components/index.dart';

class FollowDetailsScreen extends StatefulWidget {
  final FollowDetail followDetail;

  const FollowDetailsScreen({Key? key, required this.followDetail})
      : super(key: key);

  @override
  State<FollowDetailsScreen> createState() => _FollowDetailsScreenState();
}

class _FollowDetailsScreenState extends State<FollowDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final FollowDetail followDetail = widget.followDetail;
  }

  @override
  Widget build(BuildContext context) {
    final FollowDetail followDetail = widget.followDetail;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Detalles del Seguimiento'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Servicio: ${widget.followDetail.nombreServicio}',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Descripción del servicio:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.descripcionServicio,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Fecha de Inicio del Seguimiento:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.fechaIniSeguimiento,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Fecha de Finalización del Seguimiento:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.fechaFinSeguimiento,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Estado del Seguimiento:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.estadoSeguimiento,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Matricula del Vehiculo:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.marcaVehiculo,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Modelo del Vehiculo:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.modeloVehiculo,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Marca del Vehiculo:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.marcaVehiculo,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 12.0),
            const Text(
              'Color del Vehiculo:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.followDetail.colorVehiculo,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
