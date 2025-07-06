import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clothes_store/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Search Product Tests', () {
    // Test case TC-Search-01: Tìm kiếm sản phẩm với từ khóa hợp lệ
    testWidgets('Search product with valid keyword', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Đăng nhập trước (giả định thành công để vào màn hình chính)
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();
      expect(find.text('DDTV STORE'), findsOneWidget);

      // Tìm và nhập từ khóa "quần jeans"
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'quần jeans');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      // Kiểm tra kết quả
      expect(find.text('quần jeans', skipOffstage: false), findsWidgets);
    });

    // Test case TC-Search-02: Tìm kiếm sản phẩm với từ khóa khác
    testWidgets('Search product with different keyword', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Đăng nhập
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle();
      expect(find.text('DDTV STORE'), findsOneWidget);

      // Tìm và nhập từ khóa "áo thun"
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'áo thun');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();

      // Kiểm tra kết quả
      expect(find.text('áo thun', skipOffstage: false), findsWidgets);
    });

    // Test case TC-Search-03: Tìm kiếm với từ khóa không tồn tại
    testWidgets('Search with non-existent keyword', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 5));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Tìm với từ khóa "giày dép"
      print('Entering search keyword: giày dép');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'giày dép');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 10)); // Tăng thời gian chờ lên 10 giây

      // Kiểm tra thông báo (điều chỉnh dựa trên thông báo thực tế)
      print('Checking for error message...');
      expect(find.text('Không có sản phẩm'), findsOneWidget); // Thay bằng thông báo thực tế
    });

    // Test case TC-Search-04: Tìm kiếm với ký tự đặc biệt
    testWidgets('Search with special characters', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Tìm với từ khóa "quần@#%"
      print('Entering search keyword: quần@#%');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'quần@#%');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Kiểm tra thông báo
      print('Checking for invalid keyword message...');
      expect(find.text('Không có sản phẩm'), findsOneWidget); // Điều chỉnh thông báo thực tế
    });

    // Test case TC-Search-05: Không nhập từ khóa
    testWidgets('Search without keyword', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Để trống từ khóa và nhấn Enter
      print('Entering empty search keyword');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, '');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Kiểm tra thông báo
      print('Checking for empty keyword message...');
      expect(find.text('Bạn đang tìm gì?'), findsOneWidget); // Điều chỉnh thông báo thực tế
    });

    // Test case TC-Search-06: Tìm kiếm với 50 ký tự (giới hạn trên)
    testWidgets('Search with 50 characters', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Tìm với từ khóa 50 ký tự
      String keyword = 'a' * 50;
      print('Entering search keyword: $keyword');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, keyword);
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Kiểm tra kết quả
      print('Checking search results for 50-character keyword...');
      expect(find.text(keyword, skipOffstage: false), findsWidgets);
    });

    // Test case TC-Search-07: Tìm kiếm với 51 ký tự (vượt giới hạn)
    testWidgets('Search with 51 characters', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Tìm với từ khóa 51 ký tự
      String keyword = 'a' * 51;
      print('Entering search keyword: $keyword');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, keyword);
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Kiểm tra thông báo
      print('Checking for keyword limit message...');
      expect(find.text('Từ khóa vượt quá giới hạn. Vui lòng nhập tối đa 50 ký tự'), findsOneWidget); // Điều chỉnh thông báo thực tế
    });

    // Test case TC-Search-08: Tìm kiếm với từ khóa hợp lệ bằng phím Enter
    testWidgets('Search with valid keyword using Enter key', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Tìm với từ khóa "váy"
      print('Entering search keyword: váy');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'váy');
      await tester.pumpAndSettle();

      // Nhấn phím Enter
      print('Pressing Enter key...');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Kiểm tra kết quả
      print('Checking search results for "váy"...');
      expect(find.text('váy', skipOffstage: false), findsWidgets);
    });

    // Test case TC-Search-09: Spam phím Enter với từ khóa sai
    testWidgets('Spam Enter key with invalid keyword', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Đăng nhập
      print('Attempting login...');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Login successful, on main screen.');

      // Nhập từ khóa sai "@#%" và spam phím Enter 5 lần
      print('Entering invalid search keyword: @#%');
      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, '@#%');
      await tester.pumpAndSettle();

      print('Spamming Enter key 5 times...');
      for (int i = 0; i < 5; i++) {
        await tester.testTextInput.receiveAction(TextInputAction.search);
        await tester.pumpAndSettle(Duration(milliseconds: 500));
      }

      // Kiểm tra thông báo khóa
      print('Checking for spam protection message...');
      expect(find.text('Vui lòng thử lại sau 30 giây'), findsOneWidget);
    });
  });
}