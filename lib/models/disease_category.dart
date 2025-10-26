class DiseaseCategory {
  final String id;
  final String title;
  final String icon;
  final List<String> diseases;

  DiseaseCategory({
    required this.id,
    required this.title,
    required this.icon,
    required this.diseases,
  });
}

// Define your categories here
List<DiseaseCategory> diseaseCategories = [
  DiseaseCategory(
    id: 'A',
    title: 'সংক্রমণজনিত রোগ',
    icon: '🌼',
    diseases: [
      'সর্দি-কাশি (Common Cold)',
      'ফ্লু (Fever)',
      'ইনফ্লুয়েঞ্জা (Flu)',
      'টাইফয়েড (Typhoid Fever)',
      'নিউমোনিয়া (Pneumonia)',
      'জন্ডিস (Jaundice)',
      'হাম (Measles)',
      'পোলিও (Polio)',
      'আমাশয় (Dysentery)',
      'যক্ষ্মা / টিবি (Tuberculosis)',
      'ম্যালেরিয়া (Malaria)',
      'ডেঙ্গু জ্বর (Dengue Fever)',
      'চিকুনগুনিয়া (Chikungunya)',
      'কলেরা (Cholera)',
      'হেপাটাইটিস A.B.C (Hepatitis)',
      'খুব জ্বর (Mumps)',
      'করোনা-১৯ (COVID-19)',
      'হুপিং কফ (Whooping Cough)',
      'রুবেলা (Rubella)',
      'টিটেনাস (Tetanus)',
      'মেনিনজাইটিস (Meningitis)',
    ],
  ),
  DiseaseCategory(
    id: 'B',
    title: 'খাবর ও পুষ্টির সমস্যা',
    icon: '🍴',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'C',
    title: 'লাসাতন ও ইতলরগ', // Assuming typo for 'লাস্যতা' or similar
    icon: '💚',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'D',
    title: 'মানুষ প্রদিনতিক রোগ', // Assuming typo for 'প্রাদি' or similar
    icon: '🧠',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'E',
    title: 'নেখা, কান, নাত ও গোল', // Assuming typo for 'নাক' or similar
    icon: '🩺',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'F',
    title: 'চাৰ্মরোগ ও আলালরিক', // Assuming typo for 'ত্বক' or similar
    icon: '⭐',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'G',
    title: 'হাৰাগত ও নির্ণাশীতি সমস্যা', // Assuming typo for 'হার্মোন' or similar
    icon: '🧪',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'H',
    title: 'নাত্রী ও প্ৰজনন ব্যাবা', // Assuming typo for 'নারী' or similar
    icon: '⭕',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'I',
    title: 'পুরুষ ব্যাবা', // Assuming typo for 'পুরুষ' or similar
    icon: '♂️',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'J',
    title: 'বিড়ার ও যুক্তবন', // Assuming typo for 'বীর্য' or similar
    icon: '🦴',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'K',
    title: 'হাড়, নাসপেশি ও তন্তু',
    icon: '🦴',
    diseases: [], // Add diseases for this category
  ),
  DiseaseCategory(
    id: 'L',
    title: 'শিশুদের সবাবাম রোগ', // Assuming typo for 'সাধারণ' or similar
    icon: '👶',
    diseases: [], // Add diseases for this category
  ),
];