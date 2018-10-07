/*
		===========================================================
						Iterator Plugin v1.0
					
						Kodlama: Burak (NexoR)
						
							05.05.2018
						
			Bu plugin ile degerlerinize hızlıca ulasabilirsiniz.
		===========================================================	
*/

#if defined _Iterator_included
	#endinput
#endif
#define _Iterator_included

#define Iterator_For(%0,%1) \
	for(new %1 = 0, j = Iterator_Size(%0); %1 != j; %1++)

native Iterator_Olustur();
native Iterator_Ekle(ni_Index, ni_Deger);
native Iterator_Sil(ni_Index, ni_Deger);
native Iterator_Bul(ni_Index, ni_Deger);
native Iterator_Getir(ni_Index, ni_Index2);
native Iterator_Size(ni_Index);
native Iterator_Temizle(ni_Index);