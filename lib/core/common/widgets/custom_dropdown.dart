import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

class CustomDropdown extends StatefulWidget {
  final Place? selectedCountry;
  final List<Place>? countries;
  final ValueChanged<Place?> onCountryChanged;

  const CustomDropdown({
    super.key,
    required this.selectedCountry,
    required this.countries,
    required this.onCountryChanged,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = false;
  List<Place>? _countries;

  @override
  void initState() {
    super.initState();
    _countries = widget.countries;
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
                Text(widget.selectedCountry?.value ?? 'Select Country'),
                Icon(_isDropdownOpen
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Scrollbar(
              thickness: 4,
              thumbVisibility: true,
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: _countries?.map((country) {
                      return ListTile(
                        style: ListTileStyle.list,
                        visualDensity: VisualDensity.compact,
                        onTap: () => _selectCountry(country),
                        dense: true,
                        title: Text(country.value ?? 'Select'),
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ),
      ],
    );
  }
}
