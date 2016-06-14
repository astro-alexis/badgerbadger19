# badgerbadger19
badgerbadger19 is the badge-maker script for Cool Stars 19. Free to use for free for other events.

What you need:
- bash
- perl
- sed
- inkscape

badgerbadger19 works the following way:
##Inputs:
A star-separated-value input file (all field separated with asterisks). In the case of CS19 the file has the following columns:
1. NAME1 (first name)
2. NAME2 (last name)
3. INSTITUTE (affiliation)
4. REGDATE (registration date)
5. ORDERID (registration number)
6. REGFEE  (registration fee)
7. BANQUETPRICE (conference banquet fee)
8. TOURPRICE (excursion fee)
9. TOURTYPE (which tour?)
10. BUSPRICE (bus pass fee)
11. NATIONPRICE (nation card fee)
12. ADMINPRICE (administrative fee)
13. EXVATPRICE (price excl VAT)
14. DELTAVAT (VAT)
15. VATPRICE (price incl VAT)
16. TRANSACTIONPRICE (amount paid)
17. BALANCE (VATPRICE - TRANSACTION PRICE)
18. PAYMENTTYPE (type of payment)
19. INVOICEREF (reference of the invoice)
20. COMPANY (payment info)
21. ADDRESS (payment info)
22. CITY (payment info)
23. POSTALCODE (payment info)
24. COUNTRY (payment info)
25. DIET (dietary constraints)
26. TAG1 (research tag)
27. TAG2 (research tag)
28. TAG3 (research tag)
29. TAG4 (research tag)
30. TAG5(research tag)

A SVG template (an example is included: template.svg). This template has placeholders that will be replaced by badgerbadger19.sh

##Outputs:
PDF badges in the pdf/ folder, SVG badges in svg/ folder, and PNG badges in the png/ folder

## How to run this thing:
bash badgerbadger19.sh input-file

So with the input example file included:
bash badgerbadger19.sh input.scv

This is v0, the research badges are not included yet. I would need to find an entire set that can be used for free. Stay tuned.

## why badgerbadger19?
It makes badges, it's a badger. I like badger badger https://www.youtube.com/watch?v=hGlyFc79BUE
