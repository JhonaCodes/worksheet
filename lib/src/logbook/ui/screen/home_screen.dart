import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';
import 'package:worksheet/src/common/ui/widget/recent_activities_widget.dart';
import 'package:worksheet/src/common/ui/widget/responsive_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),

            ResponsiveDashboardHeader(
              children: [
                _MobileCards(
                  title: 'Total Actividades',
                  value: '24',
                  icon: Icons.arrow_upward,
                  iconColor: Colors.green,
                  data: '12% mas que ayer',
                ),
                _MobileCards(
                  title: 'Personal Activo',
                  value: '8',
                  icon: Icons.add,
                  iconColor: Colors.blue,
                  data: '4',
                ),
                _MobileCards(
                  title: 'Tareas Pendientes',
                  value: '5',
                ),
                _MobileCards(
                  title: 'Completadas Hoy',
                  value: '19',
                  icon: Icons.arrow_upward,
                  iconColor: Colors.green,
                  data: '8%',
                ),
              ],
            ),

            SizedBox(height: 20,),

            Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Title(color: Colors.black, child: Text('Recientes', style: Theme.of(context).textTheme.titleLarge, )),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(Colors.indigo)
                      ),
                      onPressed: (){},
                      child: Text('Ver todas', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                subtitle: Column(
                  children: [
                    RecentActivitiesWidget(
                      title: 'Mantenimiento Preventivo',
                      subtitle: 'Sector Norte 10:30 AM Carlos M.',
                      textStatus: 'Riesgo Bajo',
                      typeLabel: TypeInfoLabel.success,
                    ),
                    RecentActivitiesWidget(
                      title: 'Inspección de Seguridad',
                      subtitle: "Área Principal 11:45 AM Ana L.",
                      textStatus: 'Riesgo Medio',
                      typeLabel: TypeInfoLabel.warning,
                    ),
                    RecentActivitiesWidget(
                      title: 'Reparación de Emergencia',
                      subtitle: "Sector Sur 12:15 PMRoberto S.",
                      textStatus: 'Riesgo Alto',
                      typeLabel: TypeInfoLabel.error,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MobileCards extends StatelessWidget {
  final String title;
  final String value;
  final String? data;
  final IconData? icon;
  final Color? iconColor;

  const _MobileCards(
      {super.key,
      required this.value,
      required this.title,
      this.data,
      this.icon,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 100,
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w300,
              color: Colors.blueGrey[500],
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (data != null)
                InfoLabel(
                  leftIcon: icon != null
                      ? Icon(
                          icon!,
                          color: iconColor,
                          size: 12,
                        )
                      : null,
                  text: data!,
                  contrastLevel: 0.07,
                  backgroundColor: iconColor,
                  typeInfoLabel: TypeInfoLabel.warning,
                )
            ],
          ),
        ),
      ),
    );
  }
}
