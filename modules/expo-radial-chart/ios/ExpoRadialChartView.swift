import ExpoModulesCore
import DGCharts

struct Series : Record{
    @Field
    
    var color :UIColor = UIColor.black
    
    @Field
    var percentage: Double = 0
}
// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class ExpoRadialChartView: ExpoView {
    let chartView = PieChartView()
    
    required init(appContext: AppContext? = nil) {
      super.init(appContext: appContext)
      clipsToBounds = true
      addSubview(chartView)
    }
    
    override func layoutSubviews() {
        chartView.frame = bounds
      }
    
    func setChartData(data: [Series]) {
        let set1 = PieChartDataSet(entries: data.map({ (series: Series) -> PieChartDataEntry in
          return PieChartDataEntry(value: series.percentage)
        }))
        set1.colors = data.map({ (series: Series) -> UIColor in
          return series.color
        })
        
        chartView.centerText = "Hello Expo Modules"
        let chartData: PieChartData = [set1]
        chartView.data = chartData
      }
  
}
