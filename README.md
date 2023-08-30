# PeakWatch

PeakWatch is a project to demonstrate, evaluate, and validate the functionality of the [PeakSwift](https://github.com/CardioKit/PeakSwift) package, which implements algorithms for cleaning up electrocardiogram (ECG) signals, detecting R-peaks, and evaluating signal quality. The associated application [PeakWatch](https://github.com/CardioKit/PeakWatch/src) takes advantage of all the features PeakSwift has to offer and presents this content in a visually appealing way. Calculations are performed using Apple's [HKElectrocardiogram](https://developer.apple.com/documentation/healthkit/hkelectrocardiogram) on the device. The results, including electrocardiogram signals, detected R-peaks, transit time, and signal quality, can be exported as a JSON file for further analysis. A [Jupyter notebook](https://github.com/CardioKit/PeakWatch/analysis) is provided for analysis of the data to provide insight into runtime, consistency of signal quality assessment, and accuracy of detected peaks compared to the established [NeuroKit](https://github.com/neuropsychology/NeuroKit) library.

## Features

- Demonstrates the functionality of PeakSwift's ECG signal processing and R-peak detection algorithms.
- Displays ECG data in an intuitive and visually appealing format.
- Utilizes Apple's HealthKit for on-device ECG signal analysis.
- Allows exporting of results, including ECG signals, detected R-peaks, runtime, and signal quality, as a JSON file.
- Includes a Jupyter notebook for in-depth data analysis and comparison with the NeuroKit library.

## Screenshots

<img width="200" alt="PeakWatch_Main" src="https://github.com/CardioKit/PeakWatch/assets/15707108/326ada0b-c019-45b7-aec0-10f092e876f8">
<img width="200" alt="PeakWatch_Detail" src="https://github.com/CardioKit/PeakWatch/assets/15707108/866fa362-d830-49ab-a07f-761191cf05e6">
<img width="200" alt="PeakWatch_Clean" src="https://github.com/CardioKit/PeakWatch/assets/15707108/103c3453-73cc-4161-9729-3873e927e16e">
<img width="200" alt="PeakWatch_Export" src="https://github.com/CardioKit/PeakWatch/assets/15707108/757d6593-7b94-4a28-b3e1-f263b00441fe">

## Installation

To install PeakWatch:

1. Clone this repository: `git clone https://github.com/CardioKit/PeakWatch.git`
2. Navigate to `src`
3. Open the project in Xcode.
4. Build and run on a simulator or device.

## Usage

Follow these steps to use PeakWatch:

1. Launch the app on your iOS device.
2. Provide necessary permissions for accessing HealthKit data.
3. Explore the ECG data, detected R-peaks, and signal quality presented by the app.
4. Export results as a JSON file for further analysis.

## Data Analysis

Use the provided Jupyter notebook to perform detailed data analysis:

1. Navigate to the `analysis` folder.
2. Open the Jupyter notebook file.
3. Follow the instructions within the notebook to analyze runtime, signal quality assessment consistency, and peak detection accuracy.

## Dependencies

PeakWatch relies on the following libraries:

- [PeakSwift](https://github.com/CardioKit/PeakSwift)

## Contributing

We welcome contributions to enhance PeakWatch:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Create a pull request.

## License

This project is licensed under the [Apache License 2.0](LICENSE).
