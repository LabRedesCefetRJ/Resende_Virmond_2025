import 'package:accessibility_audit/config.dart';
import 'package:accessibility_audit/home/enum/enum_home.dart';
import 'package:accessibility_audit/home/menu/date.dart';
import 'package:accessibility_audit/uitls/global_styles/styles.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final Function() onUpdate;

  const Menu({super.key, required this.onUpdate});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botão Home
                MenuButton(
                  icon: Icons.home,
                  label: 'Home',
                  isSelected: Config.enumHome == EnumHome.home,
                  onTap: () {
                    setState(() {
                      Config.enumHome = EnumHome.home;
                      widget.onUpdate();
                    });
                  },
                ),

                // Botão Relatório
                MenuButton(
                  icon: Icons.list,
                  label: 'Relatório',
                  isSelected: Config.enumHome == EnumHome.report,
                  onTap: () {
                    setState(() {
                      Config.enumHome = EnumHome.report;
                      widget.onUpdate();
                    });
                  },
                ),
                MenuButton(
                  icon: Icons.task_alt,
                  label: 'Metodologia',
                  isSelected: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Metodologia',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "Coleta das páginas dos portais municipais",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const SizedBox(height: 4),
    const Text(
        "Utilizando WebScraping, capturou-se o endereço de todas as páginas acessíveis através das páginas principais."),
    const SizedBox(height: 8),
    const Text(
      "Análise de acessibilidade das páginas",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const SizedBox(height: 4),
    const Text(
        "Com a ferramenta Axe Dev Tools, as páginas foram analisadas conforme os critérios da WCAG 2.1 AA."),
    const SizedBox(height: 8),
    const Text(
      "Cálculo das notas de acessibilidade das páginas",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const SizedBox(height: 4),
    const Text(
        "A nota é calculada com base na severidade das violações e o impacto dos elementos afetados."),
    const SizedBox(height: 8),
    // Adicionando a imagem
    Center(
      child: Image.asset(
        'assets/image.png', 
        height: 200,
        width: 400,
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(height: 16),
    const Text(
      "Observatório de Acessibilidade",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    const SizedBox(height: 4),
    const Text(
        "Divulgação dos resultados através de gráficos e relatórios detalhados, incluindo notas por portal, páginas e violações."),
  ],
),

                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                MenuButton(
                  icon: Icons.accessibility_new,
                  label: 'WCAG',
                  isSelected: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'WCAG 2.1 AA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        content: const SingleChildScrollView(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "O que é?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                  "WCAG (Web Content Accessibility Guidelines) são diretrizes que garantem que os conteúdos digitais sejam acessíveis a pessoas com deficiência."),
                              SizedBox(height: 8),
                              Text(
                                "Quais são os princípios?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                  "Perceptível, Operável, Compreensível e Robusto (POUR)."),
                              SizedBox(height: 8),
                              Text(
                                "Critérios básicos do 2.1 AA",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                  "Incluem foco em acessibilidade móvel, navegação por teclado, contraste de cores, uso de textos alternativos e navegabilidade."),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                MenuButton(
                  icon: Icons.info,
                  label: 'Sobre',
                  isSelected: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'Sobre',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        content:const  SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Trabalho de conclusão de curso",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(height: 8),
                               Text("Bacharelado em Sistemas de Informação"),
                               SizedBox(height: 8,),
                              Text("CEFET - RJ"),
                              SizedBox(height: 8),
                              Text(
                                  "UNIDADE DE ENSINO DESCENTRALIZADA DE NOVA FRIBURGO/RJ"),
                             
                              SizedBox(height: 8),
                              Text("Professor Orientador: Nilson Lazarin"),
                              Text("Professor Coorientador: Rafael Scalfoni"),
                              SizedBox(height: 8),
                              Text(
                                "Alunos:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text("Alessandro Virmond\nGuilherme Resende"),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Date(),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 20),
              Text(
                label,
                style: isSelected
                    ? MyStyles.subtitleGridBlack
                    : MyStyles.titleGridWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}