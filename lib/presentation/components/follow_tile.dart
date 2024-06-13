import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowTile extends StatelessWidget {
  final String fechaInicioServicio;
  final String fechaFinServicio;
  final String matriculaVehiculo;
  final String nombreServicio;
  final String estadoServicio;

  const FollowTile({
    super.key,
    required this.nombreServicio,
    required this.fechaFinServicio,
    required this.fechaInicioServicio,
    required this.matriculaVehiculo,
    required this.estadoServicio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: getStateColor(estadoServicio.toUpperCase()),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombreServicio,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Fecha Inicio - Fecha Fin',
                      style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '$fechaInicioServicio - $fechaFinServicio',
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Matricula:  $matriculaVehiculo',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.black,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              estadoServicio.toUpperCase(),
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Color getStateColor(String state) {
    return state == 'EN ESPERA'
        ? Colors.red
        : state == 'EN PROCESO'
            ? Colors.orange
            : state == 'REVISION'
                ? Colors.yellow
                : state == 'FINALIZADO'
                    ? Colors.green
                    : Colors.blue;
  }
}
