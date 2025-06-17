import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountNumberDialog extends StatelessWidget {
  const AccountNumberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Number',
              style: TextStyle(
                fontFamily: 'VictorMono',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            _accountTile(context, 'Maybank', 'Mohd Mesyamuddin', '012754054028'),
            const SizedBox(height: 12),
            _accountTile(context, 'TouchNGo', 'Mohd Mesyamuddin', '130021615248'),
            const SizedBox(height: 12),
            _accountTile(context, 'CIMB', 'Hexa Freedom', '8605693767'),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'VictorMono',
                    color: Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _accountTile(BuildContext context, String bank, String name, String acc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  bank,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'VictorMono',
                ),
              ),
              Text(
                acc,
                style: const TextStyle(
                  fontFamily: 'VictorMono',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.copy, size: 20),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: acc));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account number copied')),
            );
          },
        ),
      ],
    );
  }
}

