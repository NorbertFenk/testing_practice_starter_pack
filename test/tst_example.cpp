#include "gtest/gtest.h"

#include "example.h"

TEST(Dummy, foobar)
{
    EXPECT_EQ(1, 1);
}

TEST(SumTest, testSumFunction)
{
	int a = example::sum(1, 3);
	EXPECT_EQ(4, a);
}

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

