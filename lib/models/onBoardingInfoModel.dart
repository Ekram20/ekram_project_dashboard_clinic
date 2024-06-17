class OnBardingInfo{

  final String title;
  final String description;
  final String image;

  OnBardingInfo(
    {required this.title,
     required this.description,
     required this.image});

}

class OnBoardingItems{

  List<OnBardingInfo> items =[
    OnBardingInfo(
      title: " الخدمات التي يوفرها",
      description: " .يوفر تطبيق عيادتي مساحة اعلانية للعيادات لعرض خدماتها الطبية ،كما يتيح للعيادة جدولة مواعيد الاطباء ،ومراقبة أداء عناصرها الطبيية وذالك عن طريق التقييمات ",
      image: "images/welcome1.png"
      ),
    OnBardingInfo(
      title: " شروط التسجيل ",
      description: " .للاشتراك في تطبيق عيادتي يجب ان يكون لديك عيادة حاصلة على إذن مزاولة وترخيص من وزارة الصحة الليبية",
      image: "images/welcome2.png"
      ),
    OnBardingInfo(
      title: "هيكلية القبول ",
      description: "  .بعد تعبئة النموذج الخاص بالاشتراك ،سيتم ارسال هذا النموذج لمدير النظام للتأكد من صحة البيانات المدخلة ، ويتم ارسال اشعار لك لاخبارك بالقبول او الرفض ،في حالة الرفض يمكنك التواصل مع مركز الصيانة لمعرفة سبب الرفض ",
      image: "images/welcome3.png"
      ),
    OnBardingInfo(
      title: " الإشتراك الشهري",
      description: " بعد الموافقة من مدير النظام ، يتم خصم قيمة 250 دينار ليبي من رصيد الرقم المدخل ، تستمر مدة الاشتراك لشهر كامل ، بعد انتهاء الاشتراك يمكنك تجديد الاشتراك بكل سهولة ، الرجاء التأكد من توفر القيمة لدى الرقم المدخل لتجنب حدوث اي عراقيل في عملية الاشتراك ",
      image: "images/welcome4.png"
      ),
    OnBardingInfo(
      title: "تواصل معنا",
      description: " .لاي استفسار يمكنك التواصل معنا ، واخبارنا بأي تطويرات تراها مناسبة  ",
      image: "images/welcome5.png")
  ];
}