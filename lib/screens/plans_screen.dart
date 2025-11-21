import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Planos de Assinatura",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPlanCard(
            title: "Explorar",
            price: "Gratuito",
            features: [
              "5 previsões por mês",
              "Gráficos simples",
              "Acesso básico ao VoxFuture",
            ],
            highlight: false,
          ),
          const SizedBox(height: 20),
          _buildPlanCard(
            title: "Orion Pro",
            price: "R\$ 49,90/mês",
            features: [
              "50 previsões por mês",
              "Gráficos avançados",
              "Relatórios",
              "1 usuário",
            ],
            highlight: false,
          ),
          const SizedBox(height: 20),
          _buildPlanCard(
            title: "Orion Master",
            price: "R\$ 139,90/mês",
            features: [
              "200 previsões por mês",
              "Gráficos e relatórios",
              "Até 3 usuários",
            ],
            highlight: true,
          ),
          const SizedBox(height: 20),
          _buildPlanCard(
            title: "Orion Ultra",
            price: "R\$ 289,90/mês",
            features: [
              "Previsões ilimitadas",
              "Todos os recursos incluídos",
              "Até 10 usuários",
            ],
            highlight: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required bool highlight,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: highlight ? Colors.amber.withOpacity(0.15) : Colors.black54,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlight ? Colors.amber : Colors.white24,
          width: 1.5,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: highlight ? Colors.amber : Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: TextStyle(
              color: highlight ? Colors.amberAccent : Colors.amber,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          for (var feature in features)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.amber, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Em breve: integração Stripe
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text(
              "Assinar $title",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
