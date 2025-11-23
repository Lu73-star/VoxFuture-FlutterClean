import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plans = [
      {
        "title": "Explorar (FREE)",
        "price": "R\$ 0,00",
        "features": [
          "5 previsões por mês",
          "Gráficos simples",
          "Acesso básico"
        ]
      },
      {
        "title": "Orion Pro",
        "price": "R\$ 49,90/mês",
        "features": [
          "50 previsões/mês",
          "Gráficos avançados",
          "Relatórios inteligentes",
          "1 usuário"
        ]
      },
      {
        "title": "Orion Master",
        "price": "R\$ 139,90/mês",
        "features": [
          "200 previsões/mês",
          "Análises completas",
          "Relatórios detalhados",
          "Até 3 usuários"
        ]
      },
      {
        "title": "Orion Ultra",
        "price": "R\$ 289,90/mês",
        "features": [
          "Previsões ilimitadas",
          "Todos os recursos liberados",
          "Até 10 usuários",
          "Suporte prioritário"
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
            return Row(
              children: [
                const Icon(Icons.check, color: Colors.amber, size: 18),
                const SizedBox(width: 6),
                Text(
                  plan["features"][i],
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
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
