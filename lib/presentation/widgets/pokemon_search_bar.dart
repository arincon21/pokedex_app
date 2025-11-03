import 'package:flutter/material.dart';

class PokemonSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onSubmitted;

  const PokemonSearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFE8E8E8),
                  width: 1.5,
                ),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onSubmitted: (_) => onSubmitted?.call(),
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  hintText: 'Procurar Pókemon...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 45,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE8E8E8),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: onSubmitted,
                child: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}