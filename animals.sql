CREATE TABLE "public.Animals" (
	"animal_id" serial NOT NULL,
	"animal_name" TEXT NOT NULL,
	"animal_onboard_date" DATE NOT NULL,
	"animal_adoption_date" DATE NOT NULL,
	"animal_breed" TEXT NOT NULL,
	"breed_id" int NOT NULL,
	"vax_id" int NOT NULL,
	"vax_status" int NOT NULL,
	CONSTRAINT "Animals_pk" PRIMARY KEY ("animal_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Breeds" (
	"breed_id" serial NOT NULL,
	"breed_name" TEXT NOT NULL,
	"breed_nutrition" TEXT NOT NULL,
	"breed_anatomy" TEXT NOT NULL,
	CONSTRAINT "Breeds_pk" PRIMARY KEY ("breed_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.animal_vax" (
	"vax_id" serial NOT NULL,
	"vax_status" serial NOT NULL,
	"animal_id" int NOT NULL,
	"breed_name" TEXT NOT NULL,
	"breed_id" int NOT NULL,
	CONSTRAINT "animal_vax_pk" PRIMARY KEY ("vax_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Adoption" (
	"adoption_id" serial NOT NULL,
	"adoption_date" serial NOT NULL,
	"vax_status" TEXT NOT NULL,
	"breed_name" TEXT NOT NULL,
	"breed_nutrition" TEXT NOT NULL,
	"animal_onboard" DATE NOT NULL,
	CONSTRAINT "Adoption_pk" PRIMARY KEY ("adoption_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Animals" ADD CONSTRAINT "Animals_fk0" FOREIGN KEY ("animal_adoption_date") REFERENCES "Adoption"("adoption_date");
ALTER TABLE "Animals" ADD CONSTRAINT "Animals_fk1" FOREIGN KEY ("animal_breed") REFERENCES "Breeds"("breed_name");
ALTER TABLE "Animals" ADD CONSTRAINT "Animals_fk2" FOREIGN KEY ("breed_id") REFERENCES "Breeds"("breed_id");
ALTER TABLE "Animals" ADD CONSTRAINT "Animals_fk3" FOREIGN KEY ("vax_id") REFERENCES "animal_vax"("vax_id");
ALTER TABLE "Animals" ADD CONSTRAINT "Animals_fk4" FOREIGN KEY ("vax_status") REFERENCES "animal_vax"("vax_status");


ALTER TABLE "animal_vax" ADD CONSTRAINT "animal_vax_fk0" FOREIGN KEY ("animal_id") REFERENCES "Animals"("animal_id");
ALTER TABLE "animal_vax" ADD CONSTRAINT "animal_vax_fk1" FOREIGN KEY ("breed_name") REFERENCES "Breeds"("breed_name");
ALTER TABLE "animal_vax" ADD CONSTRAINT "animal_vax_fk2" FOREIGN KEY ("breed_id") REFERENCES "Breeds"("breed_id");

ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_fk0" FOREIGN KEY ("vax_status") REFERENCES "animal_vax"("vax_status");
ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_fk1" FOREIGN KEY ("breed_name") REFERENCES "Breeds"("breed_name");
ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_fk2" FOREIGN KEY ("breed_nutrition") REFERENCES "Breeds"("breed_nutrition");
ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_fk3" FOREIGN KEY ("animal_onboard") REFERENCES "Animals"("animal_onboard_date");




