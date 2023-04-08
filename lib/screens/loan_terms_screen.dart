import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoanTermsScreen extends StatelessWidget {
  const LoanTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        backgroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please read the following terms and conditions carefully before applying for a loan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Text(
                    "Eligibility: You must be at least 18 years old and a legal resident of the country in which the lending application is offered to be eligible to apply for a loan.Loan amount and interest rate: The loan amount and interest rate offered from our company is 0%.Repayment: You will be required to make payments on the time.Late payments and default: If you fail to make a payment on time, you may be charged a late fee. If you continue to miss payments, your loan may go into default and may be reported to credit bureaus, which may negatively impact your credit score.Prepayment penalties: If you pay off your loan early, you may be charged a prepayment penalty. The penalty amount will be determined based on the remaining balance of the loan.Use of funds: This fund won't use an illegal activities.Termination: The lender reserves the right to terminate the loan agreement at any time if you fail to meet the terms and conditions of the loan.Dispute resolution: Any disputes arising from the loan agreement will be resolved through arbitration or mediation, as outlined in the loan agreement.Fees and charges: You may be charged fees and charges for various services related to the loan, including application fees, origination fees, and late payment fees. The fees and charges will be outlined in the loan agreement.Use of personal information: The lender may collect and use personal information provided by you for the purpose of evaluating your loan application and servicing your loan.Change in terms: The lender reserves the right to change the terms and conditions of the loan agreement at any time. Any changes will be communicated to you in writing.Availability of funds: The lender does not guarantee the availability of funds for any loan application, and reserves the right to deny any loan application at their discretion.Communication: The lender may communicate with you via email, phone, or other means regarding your loan application or loan servicing.Governing law: The loan agreement will be governed by the laws of the country or state in which the lending application is offered.Third-party fees: You may be responsible for paying fees charged by third-party entities, such as appraisers or title companies, as part of the loan process.Indemnification: You may be required to indemnify the lender for any losses or damages resulting from a breach of the loan agreement by you.Use of automatic payment: The lender may offer the option of automatic payment for loan payments. By opting in to automatic payment, you authorize the lender to withdraw funds from your designated bank account on the agreed-upon payment date.Right to verify information: The lender reserves the right to verify the information provided by you in the loan application you provided.Information accuracy: You are responsible for ensuring that all information provided in the loan application is accurate and truthful.Force majeure: The lender will not be liable for any failure to perform obligations under the loan agreement due to events outside of their control, such as natural disasters or government actions.Limitation of liability: The lender's liability for any damages or losses resulting from the loan agreement is limited to the amount of the loan.Refund policy: The lender may have a refund policy in the event that the loan is paid off early or if there is an overpayment of fees or charges.Consent to contact: By submitting a loan application, you consent to be contacted by the lender, their agents, or their affiliates via email, phone, or other means.Confidentiality: The lender will maintain the confidentiality of your personal and financial information in accordance with applicable laws and regulations.Non-transferability: The loan agreement is non-transferable and may not be assigned to any third party without the lender's consent.Entire agreement: The loan agreement constitutes the entire agreement between you and the lender and supersedes all prior negotiations and agreements, whether oral or written.",
                    maxLines: 30,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            NeumorphicButton(
              onPressed: () {
                // TODO: Implement submit button functionality
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              style: NeumorphicStyle(
                color: Colors.purple[900],
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
