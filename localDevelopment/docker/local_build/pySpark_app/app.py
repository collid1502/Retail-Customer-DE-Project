# imports
from pyspark.sql import SparkSession, Row 
#import pydeequ 
#from pydeequ.analyzers import * 
import os 


def main():
    # set environment variable SPARK_VERSION (needed for PyDeequ)
    os.environ["SPARK_VERSION"]="3.4.2"
    # create spark session 
    spark = (SparkSession.builder
                .appName("Retail DE ETL app")
                .enableHiveSupport()
                .master("local[*]")
                .config("spark.sql.adaptive.enabled", "true")
                .config("spark.dynamicAllocation.enabled", "true")
                .config("spark.sql.caseSensitive", "false")
                .config("spark.sql.parquet.writeLegacyFormat", "true")
                .config("spark.sql.sources.partitionOverwriteMode", "dynamic")
                .config("hive.exec.dynamic.partition.mode", "nonstrict")
                .config("spark.shuffle.service.enabled", "true")
                .config("spark.dynamicAllocation.InitialExecutors", "0")
                #.config("spark.jars.packages", pydeequ.deequ_maven_coord)
                #.config("spark.jars.excludes", pydeequ.f2j_maven_coord)
                .getOrCreate() 
    )

    # dummy test 
    df = spark.sparkContext.parallelize([
        Row(a="foo", b=1, c=5),
        Row(a="bar", b=2, c=6),
        Row(a="baz", b=3, c=None)]).toDF() 

    df.show() 

    # analysisResult = (AnalysisRunner(spark)
    #     .onData(df)
    #     .addAnalyzer(Size())
    #     .addAnalyzer(Completeness("b"))
    #     .run()
    # )
    # analysisResult_df = AnalyzerContext.successMetricsAsDataFrame(spark, analysisResult)
    # analysisResult_df.show()

    # stop the spark session 
    spark.stop() 


# ensures python script is being executed directly, not imported as module 
if __name__ == "__main__":
    main() 