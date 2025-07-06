import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/services.dart'; // Thêm để sử dụng phím điều hướng
import 'package:clothes_store/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Add Product Tests', () {
    // TC01: Thêm sản phẩm vào giỏ hàng thành công
    testWidgets('Product added successfully', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Bước 1: Đăng nhập
      print('Đang cố gắng đăng nhập...');
      print('Số lượng TextField tìm thấy: ${find.byType(TextField).evaluate().length}');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Đăng nhập thành công, đang ở màn hình chính.');

      // Đợi dữ liệu tải xong
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Bước 2: Nhấn vào "Xem ngay" ở phần sản phẩm nam
      print('Tìm và nhấn vào "Xem ngay" ở phần sản phẩm nam...');
      await tester.tap(find.text('Xem ngay').first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Forge Pants - Quần dài Tuysi ống đứng'), findsOneWidget);
      print('Đã nhấn "Xem ngay" thành công.');

      // Đợi dữ liệu tải xong
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Bước 3: Nhấn vào sản phẩm "Forge Pants - Quần dài Tuysi ống đứng"
      print('Tìm và nhấn vào sản phẩm "Forge Pants - Quần dài Tuysi ống đứng"...');
      final productFinder = find.text('Forge Pants - Quần dài Tuysi ống đứng');
      if (productFinder.evaluate().isEmpty) {
        print('Không tìm thấy sản phẩm "Forge Pants - Quần dài Tuysi ống đứng".');
        fail('Không tìm thấy sản phẩm mục tiêu.');
      }
      expect(productFinder, findsOneWidget);
      await tester.tap(productFinder);
      await tester.pumpAndSettle(Duration(seconds: 2));
      print('Đã nhấn vào sản phẩm "Forge Pants - Quần dài Tuysi ống đứng".');

      // Bước 4: Sử dụng phím điều hướng (trái - xuống) để di chuyển đến "Thêm vào giỏ"
      print('Sử dụng phím điều hướng để tìm nút "Thêm vào giỏ"...');
      await tester.tap(find.byType(SingleChildScrollView)); // Đặt focus vào màn hình chi tiết
      await tester.pumpAndSettle(Duration(seconds: 2));

      // Nhấn phím trái
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle(Duration(seconds: 1));
      // Nhấn phím xuống
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Nhấn Enter để chọn "Thêm vào giỏ"
      print('Nhấn phím Enter để thêm vào giỏ...');
      await tester.tap(find.text('Thêm vào giỏ').first);
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Bước 5: Kiểm tra thông báo "Thêm vào giỏ hàng thành công"
      print('Kiểm tra thông báo "Thêm vào giỏ hàng thành công"...');
      await tester.pumpAndSettle(Duration(seconds: 3)); // Tăng thời gian chờ để ổn định giao diện
      final successMessage = find.text('Thêm vào giỏ hàng thành công');
      if (successMessage.evaluate().isEmpty) {
        print('Không tìm thấy thông báo trực tiếp, kiểm tra trong SnackBar...');
        final snackBar = find.byType(SnackBar);
        if (snackBar.evaluate().isNotEmpty) {
          await tester.pumpAndSettle(Duration(seconds: 3));
          expect(find.text('Thêm vào giỏ hàng thành công').last, findsOneWidget);
        } else {
          fail('Không tìm thấy thông báo "Thêm vào giỏ hàng thành công" trong SnackBar.');
        }
      } else {
        expect(successMessage, findsOneWidget);
      }
      print('Test pass: Đã thấy thông báo "Thêm vào giỏ hàng thành công".');

      // Thêm thời gian chờ cuối để tránh lỗi rendering ảnh hưởng
      await tester.pumpAndSettle(Duration(seconds: 5));
    });

    // TC02: Thêm sản phẩm vào giỏ hàng không thành công
    testWidgets('Add product failed', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Bước 1: Đăng nhập
      print('Đang cố gắng đăng nhập...');
      print('Số lượng TextField tìm thấy: ${find.byType(TextField).evaluate().length}');
      await tester.enterText(find.byType(TextField).at(0), 'newuser@gmail.com');
      await tester.enterText(find.byType(TextField).at(1), 'Pass123A!');
      await tester.tap(find.text('Tiếp tục'));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('DDTV STORE'), findsOneWidget);
      print('Đăng nhập thành công, đang ở màn hình chính.');

      // Đợi dữ liệu tải xong
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Bước 2: Nhấn vào "Xem ngay" ở phần sản phẩm nam
      print('Tìm và nhấn vào "Xem ngay" ở phần sản phẩm nam...');
      await tester.tap(find.text('Xem ngay').first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Quần Cargo lửng nam'), findsOneWidget);
      print('Đã nhấn "Xem ngay" thành công.');

      // Đợi dữ liệu tải xong
      await tester.pumpAndSettle(Duration(seconds: 5));

      // Bước 3: Nhấn vào sản phẩm "Forge Pants - Quần dài Tuysi ống đứng"
      print('Tìm và nhấn vào sản phẩm "Quần Cargo lửng nam"...');
      final productFinder = find.text('Quần Cargo lửng nam');
      if (productFinder.evaluate().isEmpty) {
        print('Không tìm thấy sản phẩm "Quần Cargo lửng nam".');
        fail('Không tìm thấy sản phẩm mục tiêu.');
      }
      expect(productFinder, findsOneWidget);
      await tester.tap(productFinder);
      await tester.pumpAndSettle(Duration(seconds: 2));
      print('Đã nhấn vào sản phẩm "Quần Cargo lửng nam".');

      // Bước 4: Sử dụng phím điều hướng (trái - xuống) để di chuyển đến "Thêm vào giỏ"
      print('Sử dụng phím điều hướng để tìm nút "Thêm vào giỏ"...');
      await tester.tap(find.byType(SingleChildScrollView)); // Đặt focus vào màn hình chi tiết
      await tester.pumpAndSettle(Duration(seconds: 2));

      // Nhấn phím trái
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle(Duration(seconds: 1));
      // Nhấn phím xuống
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Nhấn Enter để chọn "Thêm vào giỏ"
      print('Nhấn phím Enter để thêm vào giỏ...');
      await tester.tap(find.text('Thêm vào giỏ').first);
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Bước 5: Kiểm tra thông báo "Thêm vào giỏ hàng thành công"
      print('Kiểm tra thông báo "Thêm vào giỏ hàng thành công"...');
      await tester.pumpAndSettle(Duration(seconds: 3)); // Tăng thời gian chờ để ổn định giao diện
      final successMessage = find.text('Thêm vào giỏ hàng thành công');
      if (successMessage.evaluate().isEmpty) {
        print('Không tìm thấy thông báo trực tiếp, kiểm tra trong SnackBar...');
        final snackBar = find.byType(SnackBar);
        if (snackBar.evaluate().isNotEmpty) {
          await tester.pumpAndSettle(Duration(seconds: 3));
          expect(find.text('Thêm vào giỏ hàng thành công').last, findsOneWidget);
        } else {
          fail('Không tìm thấy thông báo "Thêm vào giỏ hàng thành công" trong SnackBar.');
        }
      } else {
        expect(successMessage, findsOneWidget);
      }
      print('Test pass: Đã thấy thông báo "Thêm vào giỏ hàng thành công".');

      // Thêm thời gian chờ cuối để tránh lỗi rendering ảnh hưởng
      await tester.pumpAndSettle(Duration(seconds: 5));
    });
  });
}