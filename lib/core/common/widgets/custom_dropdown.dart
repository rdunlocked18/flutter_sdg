import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

class CustomDropdown extends StatefulWidget {
  final String? firstElementLabel;
  final Place? selectedCountry;
  final List<Place>? countries;
  final ValueChanged<Place?> onCountryChanged;

  const CustomDropdown({
    super.key,
    required this.selectedCountry,
    required this.countries,
    required this.onCountryChanged,
    this.firstElementLabel,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = false;
  List<Place>? _countries;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _countries = widget.countries;
    _scrollController = ScrollController();
    _reorderCountries(widget.selectedCountry);
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _selectCountry(Place? country) {
    widget.onCountryChanged(country);
    _reorderCountries(country);
    _toggleDropdown();
  }

  void _reorderCountries(Place? selectedCountry) {
    if (selectedCountry != null && _countries != null) {
      _countries!.remove(selectedCountry);
      _countries!.insert(0, selectedCountry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _toggleDropdown,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedCountry?.value ??
                      widget.firstElementLabel ??
                      'Select Country',
                ),
                Icon(_isDropdownOpen
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (_isDropdownOpen)
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 20, maxHeight: 200),
            child: Container(
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Scrollbar(
                controller: _scrollController,
                thickness: 4,
                thumbVisibility: true,
                child: ListView(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: _countries?.map((country) {
                        return ListTile(
                          style: ListTileStyle.list,
                          visualDensity: VisualDensity.compact,
                          onTap: () => _selectCountry(country),
                          dense: true,
                          title: Text(country.value ??
                              widget.firstElementLabel.toString()),
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
