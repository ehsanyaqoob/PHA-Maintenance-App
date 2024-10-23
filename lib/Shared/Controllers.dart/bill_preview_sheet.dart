import 'package:pharesidence/exports/exports.dart';

import '../../features/Views/GenerateBill/generate_bill_preview.dart';

 void _showBillPreview(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BillPreviewView(psid: '',);
      },
    );
  }