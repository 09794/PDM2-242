import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  double _budget = 1000.0;

  void _updateBudget(double value) {
    setState(() {
      _budget = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Planejamento Financeiro',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Orçamento mensal: R\$ ${_budget.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18),
          ),
          Slider(
            value: _budget,
            min: 100,
            max: 10000,
            divisions: 99,
            label: _budget.toStringAsFixed(2),
            onChanged: _updateBudget,
          ),
        ],
      ),
    );
  }
}
