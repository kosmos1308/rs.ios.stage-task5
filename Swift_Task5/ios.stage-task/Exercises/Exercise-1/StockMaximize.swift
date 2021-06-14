import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
            if (prices.count == 0 || prices == [0]) {
                return 0
            }
            
            var result = 0
            var max = prices.max()!
            for (index, elem ) in prices.enumerated() {
                if (index < prices.endIndex-1) {
                
                if ( elem < max && index < prices.firstIndex(of: max)!) {
                    result += max - elem
                }
                
                if (elem < max && index > prices.firstIndex(of: max)!) {
                    max = prices[(prices.firstIndex(of: max)!+1)...].max()!
                   if (elem < max) {
                    result += max - elem
                    }
                }
                }
            }

            return result
        }
}
