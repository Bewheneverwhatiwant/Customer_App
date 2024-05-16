import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  final List<String> checkedMenus;

  const BuyPage({Key? key, required this.checkedMenus}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final TextEditingController _deliveryInstructionsController =
      TextEditingController();
  final TextEditingController _riderInstructionsController =
      TextEditingController();
  final TextEditingController _additionalChargeController =
      TextEditingController(text: '4000');
  bool useSafeNumber = false;
  bool useNextTime = false;
  int selectedUtensilOption = 0;
  bool useRiderNextTime = false;

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Expanded(child: Text('잠시만 기다려주세요. 결제 중입니다...')),
            ],
          ),
        );
      },
    );

    // Simulate a delay for payment processing
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the loading dialog
      _showPaymentSuccessDialog();
    });
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('결제가 완료되었습니다!'),
        );
      },
    );

    // Simulate a delay before returning to home screen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the success dialog
      Navigator.popUntil(
          context, (route) => route.isFirst); // Return to home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주문자 정보'),
        backgroundColor: const Color(0xFF161F4E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('주문자 정보'),
            _buildUserInfo(),
            const SizedBox(height: 16),
            _buildSectionTitle('가게 사장님께'),
            _buildInstructionsField('예) 건더기 빼주세요, 덜 맵게 해주세요',
                _deliveryInstructionsController, useNextTime, (value) {
              setState(() {
                useNextTime = value!;
              });
            }),
            const SizedBox(height: 16),
            _buildSectionTitle('일회용 수저, 포크'),
            _buildUtensilOptions(),
            const SizedBox(height: 16),
            _buildSectionTitle('라이더님께'),
            _buildInstructionsField('예) 조심히 안전하게 와주세요 :)',
                _riderInstructionsController, useRiderNextTime, (value) {
              setState(() {
                useRiderNextTime = value!;
              });
            }),
            const SizedBox(height: 16),
            _buildOrderSummary(),
            const SizedBox(height: 16),
            _buildPaymentButton(),
            const SizedBox(height: 16),
            _buildOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfoRow('배달주소', '경기도 용인시 처인구 모현읍 백옥대로 2384번길 11'),
          _buildUserInfoRow('전화번호', '010-4595-7817'),
          _buildSafeNumberOption(),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          if (label == '배달주소')
            TextButton(
              onPressed: () {},
              child: const Text(
                '변경',
                style: TextStyle(color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSafeNumberOption() {
    return Row(
      children: [
        Checkbox(
          value: useSafeNumber,
          onChanged: (value) {
            setState(() {
              useSafeNumber = value!;
            });
          },
        ),
        const Text(
          '안심번호 사용',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildInstructionsField(String hint, TextEditingController controller,
      bool useNextTimeOption, ValueChanged<bool?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: useNextTimeOption,
              onChanged: onChanged,
            ),
            const Text(
              '다음에도 사용',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUtensilOptions() {
    return Column(
      children: [
        _buildRadioOption(0, '일회용 수저, 포크 안주셔도 돼요.'),
        _buildRadioOption(1, '일회용 수저, 포크 넣어주세요.'),
      ],
    );
  }

  Widget _buildRadioOption(int value, String text) {
    return RadioListTile<int>(
      value: value,
      groupValue: selectedUtensilOption,
      onChanged: (int? newValue) {
        setState(() {
          selectedUtensilOption = newValue!;
        });
      },
      title: Text(text),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '주문 내역',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_ShopImg_ex.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '야미마라탕',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '[주문 메뉴]',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ...widget.checkedMenus.map((menu) {
                  return Text(
                    menu,
                    style: const TextStyle(fontSize: 14),
                  );
                }).toList(),
                const SizedBox(height: 8),
                const Text(
                  '메뉴 가격: 17000원',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildCostRow('기본 배달비', '1000원'),
                _buildCostRow('추가 배달비', '${_additionalChargeController.text}원'),
                const SizedBox(height: 8),
                TextField(
                  controller: _additionalChargeController,
                  decoration: InputDecoration(
                    hintText: '추가 배달비 입력',
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                const Text(
                  '총 결제 금액: 22000원',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentButton() {
    return ElevatedButton(
      onPressed: () {
        // 결제 로직 추가
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: const Color(0xFF95B3FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        '신용/체크카드',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildOrderButton() {
    return ElevatedButton(
      onPressed: _showLoadingDialog,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: const Color(0xFF95B3FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        '22000원 배달 주문하기',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
