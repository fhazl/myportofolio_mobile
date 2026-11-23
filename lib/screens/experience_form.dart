import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _organizationController = TextEditingController();
  final _roleController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _linkController = TextEditingController();

  String _experienceType = 'Organization';
  DateTime? _startDate;
  DateTime? _endDate;
  bool _currentlyActive = false;

  final List<String> _experienceTypes = [
    'Organization',
    'Committee',
    'Volunteer',
    'Internship',
    'Job',
  ];

  @override
  void dispose() {
    _organizationController.dispose();
    _roleController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) {
    final day = d.day.toString().padLeft(2, '0');
    final month = d.month.toString().padLeft(2, '0');
    return '$day/$month/${d.year}';
  }

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initial = (isStart ? _startDate : _endDate) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1990),
      lastDate: DateTime(now.year + 5),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        _startDateController.text = _formatDate(picked);
      } else {
        _endDate = picked;
        _endDateController.text = _formatDate(picked);
      }
    });
  }

  String? _validateRequired(String? value, String label, int maxLength) {
    if (value == null || value.trim().isEmpty) {
      return '$label cannot be empty!';
    }
    if (value.trim().length > maxLength) {
      return '$label must be at most $maxLength characters!';
    }
    return null;
  }

  String? _validateLink(String? value) {
    if (value == null || value.trim().isEmpty) return null; // optional
    final uri = Uri.tryParse(value.trim());
    final valid = uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.contains('.');
    if (!valid) {
      return 'Enter a valid URL (starting with http:// or https://)';
    }
    return null;
  }

  void _showSummary() {
    final link = _linkController.text.trim();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Experience saved successfully!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Organization / Company: ${_organizationController.text.trim()}'),
                Text('Role: ${_roleController.text.trim()}'),
                Text('Type: $_experienceType'),
                Text('Start Date: ${_startDateController.text}'),
                Text(
                  'End Date: ${_currentlyActive ? 'Present' : _endDateController.text}',
                ),
                Text('Description: ${_descriptionController.text.trim()}'),
                Text('Link: ${link.isEmpty ? '-' : link}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Experience Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Organization / Company ===
              _pad(
                TextFormField(
                  controller: _organizationController,
                  decoration: _decoration('Organization / Company',
                      hint: 'e.g. Student Executive Board (BEM)'),
                  validator: (v) => _validateRequired(v, 'Organization name', 60),
                ),
              ),
              // === Role ===
              _pad(
                TextFormField(
                  controller: _roleController,
                  decoration: _decoration('Role',
                      hint: 'e.g. Head of Event Division'),
                  validator: (v) => _validateRequired(v, 'Role', 60),
                ),
              ),
              // === Experience type ===
              _pad(
                DropdownButtonFormField<String>(
                  decoration: _decoration('Experience Type'),
                  initialValue: _experienceType,
                  items: _experienceTypes
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (v) => setState(() => _experienceType = v!),
                ),
              ),
              // === Start date ===
              _pad(
                TextFormField(
                  controller: _startDateController,
                  readOnly: true,
                  decoration: _decoration('Start Date').copyWith(
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () => _pickDate(isStart: true),
                  validator: (v) {
                    if (_startDate == null) {
                      return 'Please select a start date!';
                    }
                    return null;
                  },
                ),
              ),
              // === Currently active ===
              CheckboxListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Currently active here'),
                value: _currentlyActive,
                onChanged: (v) {
                  setState(() {
                    _currentlyActive = v ?? false;
                    if (_currentlyActive) {
                      _endDate = null;
                      _endDateController.clear();
                    }
                  });
                },
              ),
              // === End date ===
              _pad(
                TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  enabled: !_currentlyActive,
                  decoration: _decoration('End Date').copyWith(
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () => _pickDate(isStart: false),
                  validator: (v) {
                    if (_currentlyActive) return null;
                    if (_endDate == null) {
                      return 'Please select an end date!';
                    }
                    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
                      return 'End date cannot be before the start date!';
                    }
                    return null;
                  },
                ),
              ),
              // === Description ===
              _pad(
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: _decoration('Description',
                      hint: 'Describe your responsibilities and achievements'),
                  validator: (v) => _validateRequired(v, 'Description', 300),
                ),
              ),
              // === Link ===
              _pad(
                TextFormField(
                  controller: _linkController,
                  keyboardType: TextInputType.url,
                  decoration: _decoration('Link',
                      hint: 'https://... (optional)'),
                  validator: _validateLink,
                ),
              ),
              // === Save button ===
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSummary();
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pad(Widget child) =>
      Padding(padding: const EdgeInsets.all(8.0), child: child);

  InputDecoration _decoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint ?? label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }
}