class Transactionss {
  final String Code;
  final String ammount;
  final String name;
  final String time;
  final String date;
  final String account_no;
  Transactionss(
      {required this.Code,
      required this.ammount,
      required this.date,
      required this.name,
      required this.time,
      required this.account_no});

  factory Transactionss.FromJson(Map<String, dynamic> data) {
    return Transactionss(
        Code: data['transid'],
        ammount: data['ammount'],
        date: data["date"],
        name: data['name'],
        time: data['time'],
        account_no: data['account_no']);
  }
}
