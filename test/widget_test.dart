import 'package:flutter/services.dart';
import 'package:flutter_gemma_agent/flutter_gemma_agent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('All startup skills are bundled and parse with matching names', () async {
    const names = [
      'list-events',
      'create-calendar-event',
      'read-latest-email',
      'kitchen-adventure',
    ];

    for (final name in names) {
      final text = await rootBundle.loadString('assets/skills/$name/SKILL.md');
      final skill = parseSkillMd(text);
      expect(skill.name, name);
    }
  });
}
