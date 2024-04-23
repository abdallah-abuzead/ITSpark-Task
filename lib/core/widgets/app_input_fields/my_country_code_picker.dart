import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const String countryCodePackageName = 'country_calling_code_picker';

class MyCountryPickerWidget extends StatefulWidget {
  /// This callback will be called on selection of a [Country].
  final ValueChanged<Country>? onSelected;

  const MyCountryPickerWidget({Key? key, this.onSelected}) : super(key: key);

  @override
  State<MyCountryPickerWidget> createState() => _MyCountryPickerWidgetState();
}

class _MyCountryPickerWidgetState extends State<MyCountryPickerWidget> {
  List<Country> _list = [];
  List<Country> _filteredList = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  void _onSearch(text) {
    if (text == null || text.isEmpty) {
      setState(() {
        _filteredList.clear();
        _filteredList.addAll(_list);
      });
    } else {
      setState(() {
        _filteredList = _list
            .where((element) =>
                element.name.toLowerCase().contains(text.toString().toLowerCase()) ||
                element.callingCode.toLowerCase().contains(text.toString().toLowerCase()) ||
                element.countryCode.toLowerCase().startsWith(text.toString().toLowerCase()))
            .map((e) => e)
            .toList();
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    });
    loadList();
    super.initState();
  }

  void loadList() async {
    setState(() {
      _isLoading = true;
    });
    _list = await getCountries(context);

    setState(() {
      _filteredList = _list.map((e) => e).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextField(
            style: const TextStyle(fontSize: 16),
            autofocus: true,
            decoration: InputDecoration(
              suffixIcon: Visibility(
                visible: _controller.text.isNotEmpty,
                child: InkWell(
                  child: const Icon(Icons.clear),
                  onTap: () => setState(() {
                    _controller.clear();
                    _filteredList.clear();
                    _filteredList.addAll(_list);
                  }),
                ),
              ),
              border: OutlineInputBorder(borderSide: const BorderSide(), borderRadius: BorderRadius.circular(30)),
              contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              hintText: 'search_country_name_or_code'.tr(),
            ),
            textInputAction: TextInputAction.done,
            controller: _controller,
            onChanged: _onSearch,
          ),
        ),
        // const SizedBox(height: 16),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  controller: _scrollController,
                  itemCount: _filteredList.length,
                  separatorBuilder: (_, index) => Container(),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        widget.onSelected?.call(_filteredList[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 12, top: 12, left: 24, right: 24),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              _filteredList[index].flag,
                              package: countryCodePackageName,
                              width: 32,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                                child: Text(
                              '${_filteredList[index].callingCode} ${_filteredList[index].name}',
                              style: const TextStyle(fontSize: 16),
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
