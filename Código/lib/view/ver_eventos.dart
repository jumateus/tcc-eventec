import 'package:flutter/material.dart';

class VerEventosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Carreira Mobile Flutter: O Caminho'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: Nessa palestra a trilha para quem deseja se tornar um desenvolvedor mobile será revelada.'),
                Text('Palestrante: Rodrigo Santos Ferreira'),
                Text('Data e horário: 16/10/2023 - 19:30 - 20:30'),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 1
            },
          ),
          Divider(), // Adiciona um espaço entre os eventos
          ListTile(
            title: Text('IA e Ciência de Dados: Transformando dados em conhecimento'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: Esta palestra apresenta os principais conceitos sobre ciência de dados e sua relação com a inteligência artificial'),
                Text('Palestrante: Mateus Pascoalin Bonati'),
                Text('Data e horário: 17/10/2023 - 19:30 - 20:30'),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 2
            },
          ),
          Divider(),
          ListTile(
            title: Text('Oratória em Alta Performance'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: A comunicação como habilidade a ser desenvolvida para alcançarmos grandes objetivos será o tema dessa palestra'),
                Text('Palestrante: Junior Fernandez'),
                Text('Data e horário: 19/10/2023 - 19:30 - 20:30'),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 3
            },
          ),
          Divider(),
          ListTile(
            title: Text('Como a matriz GUT pode salvar sua vida (acadêmica)'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: Nesta palestra será apresentado um valioso recurso para otimização do tempo e priorização de tarefas'),
                Text('Palestrante: Adriando Cézar Buzolli'),
                Text('Data e horário: 19/10/2023 - 21:00 - 22:00'),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 3
            },
          ),
          Divider(),
          ListTile(
            title: Text('IA Generativa'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: Nesta palestra veremos os principais conceitos e aplicações para as IAs Generativas'),
                Text('Palestrante: Marcelo Claro'),
                Text('Data e horário: 20/10/2023 - 19:30 - 20:30'),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 3
            },
          ),
          Divider(),
          ListTile(
            title: Text('Internacionalização da Carreira'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: Nessa mesa redonda conheceremos a experiência dos egressos da Fatec que estão atuando no exterior, bem como descobriremos o caminho das pedras para internacionalizar a carreira de TI'),
                Text('Palestrante: Anna Patrícia Zaken China'),
                Text('Data e horário: 21/10/2023 - 09:00 - 10:00 '),
              ],
            ),
            onTap: () {
              // Lógica ao clicar no evento 3
            },
          ),
          // Adicione mais ListTiles conforme necessário
        ],
      ),
    );
  }
}