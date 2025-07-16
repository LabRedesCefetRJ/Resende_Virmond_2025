import 'package:accessibility_audit/config.dart';
import 'package:accessibility_audit/home/enum/enum_home.dart';
import 'package:accessibility_audit/uitls/global_styles/styles.dart';
import 'package:accessibility_audit/report/repository/domain_repository.dart';
import 'package:flutter/material.dart';

class InfoHome extends StatefulWidget {
  final Function() onUpdate;
  const InfoHome({super.key, required this.onUpdate});

  @override
  State<InfoHome> createState() => _InfoHomeState();
}

class _InfoHomeState extends State<InfoHome> {
  final DomainRepository domainRepository = DomainRepository();
  int domainCount = 0;

  @override
  void initState() {
    super.initState();
    _getDomainCount();
  }

  // Função para obter a quantidade de domínios
  _getDomainCount() async {
    int count = await domainRepository.getDomainCount();
    setState(() {
      domainCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {

    final double hg = MediaQuery.of(context).size.height;


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título Principal • centralizado
            Center(
              child: Text(
                "Monitoramento da acessibilidade",
                style: MyStyles.subBoldBlack,
              ),
            ),
             SizedBox(height: hg / 50),

            // Informações principais
            Wrap(
              spacing: hg / 50,
              runSpacing: 8,
              children: [
                _buildInfoItem("$domainCount Sites de prefeitura avaliados"),
                _buildInfoItem("Avaliação de Acessibilidade de acordo com as normas do WCAG 2.0"),
                _buildInfoItem("Nota de acessibilidade considerando grau de impacto das violações no site"),
              ],
            ),

             SizedBox(height: hg/40),

            // Relatórios detalhados • centralizado
            Center(
              child: Text(
                "Relatórios detalhados",
                style: MyStyles.subBoldBlack,
              ),
            ),
             SizedBox(height: hg/90),

            // Lista de relatórios
            Wrap(
              spacing: hg / 50,
              runSpacing: 8,
              children: [
                _buildInfoItem("Páginas do portal municipal"),
                _buildInfoItem("Violações de acessibilidade em cada página"),
                _buildInfoItem("Elementos envolvidos em violações"),
                _buildInfoItem("Filtros e gráficos personalizados"),
              ],
            ),
             SizedBox(height: hg / 50),

            // Botão "Ver Relatório" • centralizado
            Center(
              child: GestureDetector(
                onTap: () {
                  Config.enumHome = EnumHome.report;
                  widget.onUpdate();
                },
                child: Container(
                  height: hg / 15,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Ver Relatório",
                      style: MyStyles.subBoldwhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para exibir itens de texto formatados corretamente
  Widget _buildInfoItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 12)),
        Expanded(
          child: Text(
            text,
            style: MyStyles.bodyTextLarge,
          ),
        ),
      ],
    );
  }
}
