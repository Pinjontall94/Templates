#include <CUnit/Basic.h>
#include <stdio.h>
#include <string.h>
#include <CUnit/CUnit.h>

void test_hello_world();

int main()
{
   CU_pSuite pSuite = NULL;

   /* initialize the CUnit test registry */
   if (CUE_SUCCESS != CU_initialize_registry())
      return CU_get_error();

   /* add a suite to the registry */
   pSuite = CU_add_suite("Suite_1", 0, 0);
   if (NULL == pSuite) {
      CU_cleanup_registry();
      return CU_get_error();
   }

   /* add the tests to the suite */
   if ((NULL == CU_add_test(pSuite, "test of hello_world", test_hello_world)))
   {
      CU_cleanup_registry();
      return CU_get_error();
   }

   /* Run all tests using the CUnit Basic interface */
   CU_basic_set_mode(CU_BRM_VERBOSE);
   CU_basic_run_tests();
   CU_cleanup_registry();
   return CU_get_error();
}

void test_hello_world()
{
    char output[256] = {0};
    FILE *fp = popen("./hello_world", "r");
    fgets(output, sizeof(output), fp);
    CU_ASSERT_STRING_EQUAL("Hello, world!\n", output);
    pclose(fp);
}
