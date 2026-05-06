import 'package:flutter/material.dart';
import 'package:projeto_integrador/features/homepage/domain/models/geocache.dart';

class HomepageSidepanel extends StatefulWidget {
  // Os dados atuais (O que ele exibe)
  final FilterType selectedFilter;
  final int selectedCacheIndex;
  final String searchQuery;
  final List<GeoCache> filteredCaches; // Passe a lista filtrada também!

  // As ações (O que ele faz quando o usuário interage)
  final Function(String) onSearchChanged;
  final Function(FilterType) onFilterChanged;
  final Function(int) onCacheSelected;

  const HomepageSidepanel({
    super.key,
    required this.selectedFilter,
    required this.searchQuery,
    required this.selectedCacheIndex,
    required this.filteredCaches,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.onCacheSelected,
  });

  @override
  State<HomepageSidepanel> createState() => _HomepageSidepanelState();
}

class _HomepageSidepanelState extends State<HomepageSidepanel> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Painel lateral com lista de caches
        SizedBox(
          width: 300,
          child: Column(
            children: [
              // Header do painel
              // Search bar
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  onChanged: (value) {
                    // Chama a função passada pelo pai
                    widget.onSearchChanged(value);
                    widget.selectedCacheIndex = 0;
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar Geocaches...',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              // Filtros
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                      label: const Text('Todos'),
                      selected: widget.selectedFilter == FilterType.all,
                      onSelected: (_) => widget.onFilterChanged(FilterType.all),
                    ),
                    FilterChip(
                      label: const Text('Encontrados'),
                      selected: widget.selectedFilter == FilterType.found,
                      onSelected: (_) => widget.selectedFilter(FilterType.found),
                    ),
                    FilterChip(
                      label: const Text('Pendente'),
                      selected: widget.selectedFilter == FilterType.pending,
                      onSelected: (bool selected) {
                        setState(() => widget.selectedFilter = FilterType.pending);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Lista de caches
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCaches.length,
                  itemBuilder: (context, index) {
                    return CacheListItem(
                      cache: filteredCaches[index],
                      isSelected: widget.selectedCacheIndex == index,
                      onTap: () => widget.selectedCacheIndex = index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Painel direito com detalhes
        Expanded(
          child: Container(
            color: Colors.white,
            child: CacheDetailCard(cache: currentCache),
          ),
        ),
      ],
    ),
  }
}