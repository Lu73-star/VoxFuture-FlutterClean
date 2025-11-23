import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plans = [
      {
        "title": "VoxFuture Vision (FREE)",
        "price": "R\$ 0,00",
        "features": [
          "5 previsões mensais",
          "Acesso básico",
          "Gráficos simples",
        ]
      },
      {
        "title": "VoxFuture Insight",
        "price": "R\$ 39,90/mês",
        "features": [
          "40 previsões mensais",
          "Gráficos avançados",
          "Relatórios simples",
          "Histórico padrão",
        ]
      },
      {
        "title": "VoxFuture Oracle",
        "price": "R\$ 119,90/mês",
        "features": [
          "150 previsões mensais",
          "Relatórios inteligentes",
          "Histórico ilimitado",
          "Prioridade nas respostas",
        ]
      },
      {
        "title": "VoxFuture Infinity",
        "price": "R\$ 249,90/mês",
        "features": [
          "Previsões ilimitadas",
          "Todos os recursos liberados",
          "Gráficos avançados",
          "Acesso antecipado a novas funções",
          "Suporte premium",
        ]
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Planos de Assinatura",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return _planCard(plan);
        },
      ),
    );
  }

  Widget _planCard(Map plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan["title"],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            plan["price"],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(plan["features"].length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.amber, size: 18),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      plan["features"][i],
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Integração com STRIPE será feita depois
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: const Size(double.infinity, 45),
            ),
            child: const Text(
              "Assinar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
